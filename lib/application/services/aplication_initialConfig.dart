
// ignore_for_file: file_names

import 'package:yandex_project/application/services/application_apis.dart';
import 'package:yandex_project/application/services/application_db.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient_dto.dart';


Future<void> onStartApp() async {

  AppDBService().initHiveOptions();

  List<Ingredient> ingridientList = await AppDBService().getIngredientList();
  if (ingridientList.isEmpty) {
    ingridientList = await AppApisService().listIngredients();
    AppDBService().putIngredientList(ingridientList);
  }
}