part of 'preferences_bloc.dart';

class PreferencesState with EquatableMixin {
  final ThemeMode themeMode;

  const PreferencesState({
    required this.themeMode,
  });

  factory PreferencesState.initial() => const PreferencesState(
        themeMode: ThemeMode.system,
      );

  PreferencesState copyWith({
    ThemeMode? themeMode,
  }) {
    return PreferencesState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [
        themeMode,
      ];
}
