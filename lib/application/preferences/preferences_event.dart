part of 'preferences_bloc.dart';

@freezed
class PreferencesEvent with _$PreferencesEvent {

  const factory PreferencesEvent.changeTheme({required ThemeMode themeMode }) = _ChangeTheme;


}
