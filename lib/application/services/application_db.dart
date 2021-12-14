import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yandex_project/application/preferences/preferences_bloc.dart';
import 'package:yandex_project/domain/models/drink/drink.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient.dart';


class AppDBService {

  void initHiveOptions() async {

    Hive.registerAdapter(IngredientAdapter());

    final ingredientsBox = await Hive.openBox<List<Ingredient>>('Ingredients');
    final favoriteBox = await Hive.openBox<List<Drink>>('Favorites');
    //final settingsBox = await Hive.openBox<Settings>('Settings');
  }

  Future<void> putIngredientList(List<Ingredient> ingredientList) async {
    final ingredientsBox = await Hive.openBox<List<Ingredient>>('Ingredients');

    ingredientsBox.put('list', ingredientList);
  }

  Future<List<Ingredient>> getIngredientList() async {
    try {
      final ingredientsBox = await Hive.openBox<List<Ingredient>>('Ingredients');

      List<Ingredient>? list = ingredientsBox.get('list');
      return (list == null) ? <Ingredient>[]: list;
    } catch (error) {
      return <Ingredient>[];
    }
  }

  Future<void> putFavoriteList(List<Drink> favoriteList) async {
    final favoriteBox = await Hive.openBox<List<Drink>>('Favorites');
    favoriteBox.put('list', favoriteList);
  }

  Future<List<Drink>> getFavoriteList() async {
    try {
      final favoriteBox = await Hive.openBox<List<Drink>>('Favorites');

      List<Drink>? list = favoriteBox.get('list');
      return (list == null) ? <Drink>[]: list;
    } catch (error) {
      return <Drink>[];
    }
  }

  Future<void> putSettings(PreferencesState preferencesState) async { // didn't have model settings
    final preferencesStateBox = await Hive.openBox<PreferencesState>('PreferencesState');

    preferencesStateBox.put('settings', preferencesState);
  }

  Future<PreferencesState> getSettings() async {
    try {
      final preferencesStateBox = await Hive.openBox<PreferencesState>('PreferencesState');

      PreferencesState preferencesState = preferencesStateBox.get('settings') ?? PreferencesState.initial();
      return preferencesState;
    } catch (error) {
      return PreferencesState.initial();
    }
  }



}