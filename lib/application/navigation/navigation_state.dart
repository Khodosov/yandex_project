part of 'navigation_bloc.dart';

class NavigationState with EquatableMixin {
  final AppTab tab;

  const NavigationState({
    required this.tab,
  });

  factory NavigationState.initial() {
    return const NavigationState(
      tab: AppTab.home,
    );
  }

  NavigationState copyWith({
    AppTab? tab,
    AppTab? previousTab,
  }) {
    return NavigationState(
      tab: tab ?? this.tab,
    );
  }

  @override
  List<Object?> get props => [
        tab,
      ];
}
