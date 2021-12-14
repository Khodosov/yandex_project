part of 'preferences_bloc.dart';

class PreferencesState with EquatableMixin {
  final ThemeMode themeMode;
  final bool nonAlcoholicMode;

  const PreferencesState({
    required this.themeMode,
    required this.nonAlcoholicMode,
  });

  factory PreferencesState.initial() {
    return const PreferencesState(
      themeMode: ThemeMode.system,
      nonAlcoholicMode: false,
    );
  }

  static PreferencesState fromDB(PreferencesDB preferencesDB) {
    return PreferencesState(
      themeMode:
          ThemeMode.values.firstWhere((element) => element.toString().split('.').last == preferencesDB.themeMode),
      nonAlcoholicMode: preferencesDB.nonAlcoholicMode,
    );
  }

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
