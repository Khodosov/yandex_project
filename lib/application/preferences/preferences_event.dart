part of 'preferences_bloc.dart';

@freezed
class PreferencesEvent with _$PreferencesEvent {

  const factory PreferencesEvent.changeTheme() = _ChangeTheme;


}