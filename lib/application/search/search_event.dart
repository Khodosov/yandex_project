part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchByName({required String name}) =
      _SearchByName;

  const factory SearchEvent.randomCocktail() = _RandomCocktail;

  const factory SearchEvent.randomSelectionCocktail() =
      _RandomSelectionCocktail;

  const factory SearchEvent.addToFavorites({required Drink drink}) =
      _AddToFavorites;
}
