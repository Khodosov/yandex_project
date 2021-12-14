part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchByFilter() = _SearchByName;

  const factory SearchEvent.updateFilter({required Filter filter}) = _UpdateFilter;
  ///
  /// "Nice guys"
  ///
  const factory SearchEvent.randomCocktail() = _RandomCocktail;

  const factory SearchEvent.randomSelectionCocktail() = _RandomSelectionCocktail;

  const factory SearchEvent.addToFavorites({required Drink drink}) = _AddToFavorites;

}
