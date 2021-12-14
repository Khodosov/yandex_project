part of 'preferences_bloc.dart';

@HiveType(typeId: 2)
class PreferencesState with EquatableMixin {
  @HiveField(0) final ThemeMode themeMode;
  @HiveField(1) final bool nonAlcoholicMode;

  const PreferencesState({
    required this.themeMode,
    required this.nonAlcoholicMode,
  });

  factory PreferencesState.initial() => const PreferencesState(
        themeMode: ThemeMode.system,
        nonAlcoholicMode: false,
      );

  PreferencesState copyWith({
    ThemeMode? themeMode,
    bool? nonAlcoholicMode,
  }) {
    return PreferencesState(
      themeMode: themeMode ?? this.themeMode,
      nonAlcoholicMode: nonAlcoholicMode ?? this.nonAlcoholicMode,
    );
  }

  @override
  List<Object?> get props => [
        themeMode,
        nonAlcoholicMode,
      ];
}
