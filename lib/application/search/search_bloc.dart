import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_project/application/services/application_db.dart';
import 'package:yandex_project/application/services/connectivity_ensure.dart';
import 'package:yandex_project/domain/exception/failures.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/domain/models/filter/filter.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient.dart';
import '../services/application_apis.dart';
import 'package:yandex_project/domain/models/drink/drink.dart';

part 'search_event.dart';

part 'search_bloc.freezed.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final AppApisService apiCall;
  final AppDBService dataBase;
  final ConnectivityEnsure connectivityEnsure;
  StreamSubscription? _subscription;

  SearchBloc({
    required this.apiCall,
    required this.dataBase,
    required this.connectivityEnsure,
  }) : super(SearchState.initial(true)) {
    init();
  }

  void init() async {
    _subscription = connectivityEnsure.isConnectedStream.listen((event) {
      add(SearchEvent.onConnectivityChange(connected: event));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    yield* event.map(
      init: (e) async* {
        final ingredients = await dataBase.getIngredientList();
        final favorites = await dataBase.getFavoriteList();
        yield state.copyWith(
          ingredients: ingredients,
          favorites: favorites,
        );
      },
      onConnectivityChange: (e) async* {
        yield state.copyWith(
          isConnected: e.connected,
        );
      },
      updateFilter: (e) async* {
        yield state.copyWith(
          filter: e.filter,
        );
      },

      ///
      /// Big method for all search calls
      ///
      searchByFilter: (e) async* {
        yield state.copyWith(
          isRefreshing: true,
        );
        final nameCheck = state.filter.name != null;
        final ingredientsCheck = state.filter.ingredients != null;
        // final typeCheck = state.filter.drinkType != null;
        late Either<Failure, List<Drink>> drinks;
        drinks = nameCheck
            ? await apiCall.searchByName(state.filter.name!)
            : ingredientsCheck
                ? await apiCall.searchByName('a')
                : await apiCall.searchByName('s');
        if (drinks.isRight()) {
          final List<Drink> filtered = [];
          drinks.fold(
            (l) => null,
            (r) {
              for (final drink in r) {
                List<String>? ingredients = [];
                if (state.filter.ingredients == null) {
                  ingredients = null;
                } else {
                  for (Ingredient ing in state.filter.ingredients!) {
                    ingredients.add(ing.name.toString());
                  }
                }
                if (ingredients == null) {
                  if (state.filter.drinkType?.contains(drink.alcoholic) ??
                      true) {
                    filtered.add(drink);
                  }
                } else {
                  if (drink.ingredients.toSet().containsAll(ingredients)) {
                    if (state.filter.drinkType?.contains(drink.alcoholic) ??
                        true) {
                      filtered.add(drink);
                    }
                  }
                }
              }
            },
          );
          print('NEW STATE $filtered');
          yield state.copyWith(
            drinks: right(filtered),
            isRefreshing: false,
          );
        }
      },
      addToFavorites: (e) async* {
        dataBase.removeFavorite(id: e.drink.id);
        final List<Drink> old = List.from(state.favorites);
        if (old.contains(e.drink)) {
          old.remove(e.drink);
        } else {
          old.add(e.drink);
        }
        dataBase.putFavoriteList(old);
        yield state.copyWith(
          favorites: old,
        );
      },
      randomCocktail: (e) async* {
        yield state.copyWith(
          isRefreshing: true,
        );
        final newDrink = await apiCall.randomCocktail();
        yield state.copyWith(
          drinks: newDrink,
          isRefreshing: false,
        );
      },
      randomSelectionCocktail: (e) async* {
        yield state.copyWith(
          isRefreshing: true,
        );
        final newDrinks = await apiCall.randomSelectionCocktail();
        yield state.copyWith(
          drinks: newDrinks,
          isRefreshing: false,
        );
      },
    );
  }
}
