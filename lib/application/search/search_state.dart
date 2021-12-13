part of 'search_bloc.dart';

class SearchState with EquatableMixin {
  final List<Drink> drinks;
  final bool isRefreshing;
  final List<Drink> favorites;
  final List<String> history;
  final Filter filter;

  const SearchState({
    required this.history,
    required this.drinks,
    required this.isRefreshing,
    required this.favorites,
    required this.filter,
  });

  factory SearchState.initial() => const SearchState(
        history: <String>[],
        drinks: <Drink>[],
        isRefreshing: false,
        favorites: [],
        filter: Filter(
          drinkType: DrinkType.values,
        ),
      );

  SearchState copyWith({
    List<Drink>? drinks,
    List<Drink>? favorites,
    bool? isRefreshing,
    List<String>? history,
    Filter? filter,
  }) {
    return SearchState(
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
      ];
}
