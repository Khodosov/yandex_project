part of 'preferences_bloc.dart';


class PreferencesState with EquatableMixin {
  final bool darkMode;
  
  const PreferencesState({
    required this.darkMode,
  });

  factory PreferencesState.initial() => const PreferencesState(
    darkMode: false,
  );

  PreferencesState copyWith({
    bool? darkMode,
  }) {
    return PreferencesState(
      darkMode: darkMode ?? this.darkMode,
    );
  }

  @override
  List<Object?> get props => [
    darkMode,
  ];
}
