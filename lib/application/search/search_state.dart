part of 'search_bloc.dart';


class SearchState with EquatableMixin {
  final List<Drink> drinks;

  const SearchState({
    required this.drinks,
  });

  factory SearchState.initial() => const SearchState(
    drinks: [],
  );

  SearchState copyWith({
    List<Drink>? drinks,
  }) {
    return SearchState(
      drinks: drinks ?? this.drinks,
    );
  }

  @override
  List<Object?> get props => [
    drinks,
  ];
}
