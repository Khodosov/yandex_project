import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../services/application_apis.dart';
import 'package:yandex_project/domain/models/drink.dart';

part 'search_event.dart';

part 'search_bloc.freezed.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial());
  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    yield* event.map(
      searchByName: (e) async* {
        yield state.copyWith(
          isRefreshing: true,
        );
        final newDrinks = await AppApisService().cocktailByName(e.name.trim());
        yield state.copyWith(
          drinks: newDrinks,
          isRefreshing: false,
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
      }
    );
  }
}
