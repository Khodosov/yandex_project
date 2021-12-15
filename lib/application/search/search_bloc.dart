import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_project/application/services/application_db.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/domain/models/filter/filter.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient.dart';
import '../services/application_apis.dart';
import 'package:yandex_project/domain/models/drink/drink.dart';

part 'search_event.dart';

part 'search_bloc.freezed.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    final dataBase = AppDBService();

    yield* event.map(
      init: (e) async* {
        final ingredients = await dataBase.getIngredientList();
        final favorites = await dataBase.getFavoriteList();
        print(ingredients.length);
        print(ingredients.map((e) => e.name));
        yield state.copyWith(
          ingredients: ingredients,
          favorites: favorites,
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
        var newDrinks = <Drink>[];
        if (state.filter.name == null) {
          if (state.filter.ingredients == null) {
            if (state.filter.drinkType == null) {
              newDrinks = await AppApisService().cocktailByName((state.filter.name ?? '').trim());
            } else {
              for (var element in state.filter.drinkType!) {
                var tempList = <Drink>[];
                tempList = await AppApisService().filterByAlcoholic(element.toString());
                newDrinks = <Drink>{...newDrinks, ...tempList}.toList();
              }
            }
          } else {
            String ingredients = '';
            for (var i = 0; i < state.filter.ingredients!.length; i++) {
              if (i != state.filter.ingredients!.length - 1) {
                ingredients += state.filter.ingredients![i].toString();
                ingredients += ',';
              } else {
                ingredients += state.filter.ingredients![i].toString();
              }
            }
            newDrinks = await AppApisService().filterByIngredients(ingredients);
            if (state.filter.drinkType != null) {
              for (var element in state.filter.drinkType!) {
                var tempList = <Drink>[];
                tempList = await AppApisService().filterByAlcoholic(element.toString());
                newDrinks = <Drink>{...newDrinks, ...tempList}.toList();
              }
            }
          }
        } else {
          newDrinks = await AppApisService().cocktailByName((state.filter.name ?? '').trim());
          if (state.filter.ingredients != null) {
            for (var drink in newDrinks) {
              for (var i = 0; i < state.filter.ingredients!.length; i++) {
                if (!drink.ingredients.contains(state.filter.ingredients![i].toString())) {
                  newDrinks.remove(drink);
                  break;
                }
              }
            }
          }
          if (state.filter.drinkType != null) {
            for (var drink in newDrinks) {
              for (var i = 0; i < state.filter.drinkType!.length; i++) {
                if (drink.alcoholic != state.filter.drinkType![i]) {
                  newDrinks.remove(drink);
                  break;
                }
              }
            }
          }
        }
        yield state.copyWith(
          drinks: newDrinks,
          isRefreshing: false,
        );
      },
      addToFavorites: (e) async* {
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
        final newDrink = await AppApisService().randomCocktail();
        yield state.copyWith(
          drinks: newDrink,
          isRefreshing: false,
        );
      },
      randomSelectionCocktail: (e) async* {
        yield state.copyWith(
          isRefreshing: true,
        );
        final randDrinks = await AppApisService().randomSelectionCocktail();
        yield state.copyWith(
          drinks: randDrinks,
          isRefreshing: false,
        );
      },
    );
  }
}
