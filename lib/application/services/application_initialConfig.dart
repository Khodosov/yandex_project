// ignore_for_file: file_names

import 'package:yandex_project/application/services/application_apis.dart';
import 'package:yandex_project/application/services/application_db.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient.dart';

Future<void> onStartApp() async {
  await AppDBService().initHiveOptions();

  List<Ingredient> ingredientList = await AppDBService().getIngredientList();
  // print('onStart: ${ingredientList.length}');
  if (ingredientList.isEmpty) {
    ingredientList = await AppApisService().listIngredients();
    // print('fetch: ${ingredientList.length}');
    AppDBService().putIngredientList(ingredientList);
  }
}
