part of 'navigation_bloc.dart';

class NavigationState with EquatableMixin {
  final AppTab tab;
  final AppTab previousTab;

  const NavigationState({
    required this.previousTab,
    required this.tab,
  });

  factory NavigationState.initial() {
    return const NavigationState(
      tab: AppTab.home,
      previousTab: AppTab.home,
    );
  }

  NavigationState copyWith({
    AppTab? tab,
    AppTab? previousTab,
  }) {
    return NavigationState(
      tab: tab ?? this.tab,
      previousTab: previousTab ?? this.previousTab,
    );
  }

  @override
  List<Object?> get props => [
        tab,
        previousTab,
      ];
}
