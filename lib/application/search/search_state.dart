part of 'search_bloc.dart';

class SearchState with EquatableMixin {
  final List<Drink> drinks;
  final bool isRefreshing;
  final List<String> history;

  const SearchState({
    required this.history,
    required this.drinks,
    required this.isRefreshing,
  });

  factory SearchState.initial() => const SearchState(
        history: <String>[],
        drinks: <Drink>[],
        isRefreshing: false,
      );

  SearchState copyWith({List<Drink>? drinks, bool? isRefreshing, List<String>? history}) {
    return SearchState(
      history: history ?? this.history,
      drinks: drinks ?? this.drinks,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  List<Object?> get props => [
        drinks,
        isRefreshing,
        history
      ];
}
