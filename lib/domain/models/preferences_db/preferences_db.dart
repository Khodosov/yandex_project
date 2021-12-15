import 'package:hive/hive.dart';
import 'package:yandex_project/application/preferences/preferences_bloc.dart';

part 'preferences_db.g.dart';

@HiveType(typeId: 2)
class PreferencesDB {
  @HiveField(0) final String themeMode;
  @HiveField(1) final bool nonAlcoholicMode;

  const PreferencesDB({
    required this.themeMode,
    required this.nonAlcoholicMode,
  });

  factory PreferencesDB.initial() => const PreferencesDB(
    themeMode: 'system',
    nonAlcoholicMode: false,
  );

  static PreferencesDB toDB(PreferencesState preferencesState) {
    return PreferencesDB(
      themeMode: preferencesState.themeMode.toString().split('.').last,
      nonAlcoholicMode: preferencesState.nonAlcoholicMode,
    );
  }
}