part of 'search_bloc.dart';

class SearchState with EquatableMixin {
  final List<Drink> drinks;
  final bool isRefreshing;
  final List<Drink> favorites;
  final List<String> history;
  final Filter filter;
  final List<Ingredient> ingredients;

  const SearchState({
    required this.history,
    required this.drinks,
    required this.isRefreshing,
    required this.favorites,
    required this.filter,
    required this.ingredients,
  });

  factory SearchState.initial() => const SearchState(
        history: <String>[],
        drinks: <Drink>[],
        isRefreshing: false,
        favorites: [],
        filter: Filter(
          drinkType: DrinkType.values,
        ),
        ingredients: [],
      );

  SearchState copyWith({
    List<Drink>? drinks,
    List<Drink>? favorites,
    bool? isRefreshing,
    List<String>? history,
    Filter? filter,
    List<Ingredient>? ingredients,
  }) {
    return SearchState(
      ingredients: ingredients ?? this.ingredients,
      filter: filter ?? this.filter,
      favorites: favorites ?? this.favorites,
      history: history ?? this.history,
      drinks: drinks ?? this.drinks,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  List<Object?> get props => [
        drinks,
        isRefreshing,
        history,
        favorites,
        filter,
        ingredients,
      ];
}
