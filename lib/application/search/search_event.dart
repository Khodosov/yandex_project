part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.init() = _Init;

  const factory SearchEvent.onConnectivityChange({required bool connected}) = _OnConnectivityChange;

  const factory SearchEvent.searchByFilter() = _SearchByFilter;

  const factory SearchEvent.updateFilter({required Filter filter}) = _UpdateFilter;
  ///
  /// "Nice guys"
  ///
  const factory SearchEvent.randomCocktail() = _RandomCocktail;

  const factory SearchEvent.popularCocktails() = _PopularCocktails;

  const factory SearchEvent.latestCocktails() = _LatestCocktails;

  const factory SearchEvent.randomSelectionCocktail() = _RandomSelectionCocktail;

  const factory SearchEvent.addToFavorites({required Drink drink}) = _AddToFavorites;

}
