part of 'search_bloc.dart';

class SearchState with EquatableMixin {
  final List<Drink> drinks;
  final bool isRefreshing;

  const SearchState({
    required this.drinks,
    required this.isRefreshing,
  });

  factory SearchState.initial() => const SearchState(
        drinks: [],
        isRefreshing: false,
      );

  SearchState copyWith({List<Drink>? drinks, bool? isRefreshing}) {
    return SearchState(
      drinks: drinks ?? this.drinks,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  List<Object?> get props => [
        drinks,
        isRefreshing,
      ];
}
