import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yandex_project/application/preferences/preferences_bloc.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/domain/models/drink/drink.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient.dart';
import 'package:yandex_project/domain/models/preferences_db/preferences_db.dart';

class AppDBService {
  Future<void> initHiveOptions() async {
    await Hive.initFlutter();

    Hive.registerAdapter(IngredientAdapter());
    Hive.registerAdapter(DrinkAdapter());
    Hive.registerAdapter(PreferencesDBAdapter());
    Hive.registerAdapter(DrinkTypeAdapter());

  }

  // этот метод отрабатывает при старте, тебе он скорее всего не нужен будет
  Future<void> putIngredientList(List<Ingredient> ingredientList) async {
    final ingredientsBox = await Hive.openBox<List<Ingredient>>('Ingredients');

    ingredientsBox.put('list', ingredientList);
  }

  //получаем список ингредиентов,
  //запускай просто, он вернет что надо
  Future<List<Ingredient>> getIngredientList() async {
    try {
      final ingredientsBox = await Hive.openBox<List<Ingredient>>('Ingredients');

      List<Ingredient>? list = ingredientsBox.get('list');
      return (list == null) ? <Ingredient>[] : list;
    } catch (error) {
      return <Ingredient>[];
    }
  }

  //кладем весь список целиком
  Future<void> putFavoriteList(List<Drink> favoriteList) async {
    final favoriteBox = await Hive.openBox<List<Drink>>('Favorites');
    favoriteBox.put('list', favoriteList);
  }

  //получаем так же весь список целиком
  Future<List<Drink>> getFavoriteList() async {
    try {
      final favoriteBox = await Hive.openBox<List<Drink>>('Favorites');

      List<Drink>? list = favoriteBox.get('list');
      return (list == null) ? <Drink>[] : list;
    } catch (error) {
      return <Drink>[];
    }
  }

  /// Tested. Seems to be good enough
  Future<void> putSettings(PreferencesState preferenceState) async {
    // didn't have model settings
    final Box<PreferencesDB> preferencesDBBox = await Hive.openBox<PreferencesDB>('PreferencesDB');

    preferencesDBBox.put('settings', PreferencesDB.toDB(preferenceState));
  }
  /// Tested. Seems to be good enough
  Future<PreferencesState> getSettings() async {
    try {
      final preferencesDBBox = await Hive.openBox<PreferencesDB>('PreferencesDB');

      PreferencesDB? preferencesDB = preferencesDBBox.get('settings');
      if (preferencesDB == null) {
        return PreferencesState.initial();
      }

      return PreferencesState.fromDB(preferencesDB);
    } catch (error) {
      return PreferencesState.initial();
    }
  }
}
