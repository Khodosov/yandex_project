part of 'search_bloc.dart';


class SearchState with EquatableMixin {
  final List<String> drinks;

  const SearchState({
    required this.drinks,
  });

  factory SearchState.initial() => const SearchState(
    drinks: [],
  );

  SearchState copyWith({
    List<String>? drinks,
  }) {
    return SearchState(
      drinks: drinks ?? this.drinks,
    );
  }

  @override
  List<Object?> get props => [
  ];
}
