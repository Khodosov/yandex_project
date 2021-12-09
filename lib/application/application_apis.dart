import 'package:http/http.dart' as http;
import 'package:yandex_project/domain/models/drink.dart';
import 'dart:convert';

import 'package:yandex_project/domain/models/drink_dto.dart';
import 'package:yandex_project/domain/models/ingredient_dto.dart';

class AppApisService {
  var baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';

  //Список всех коктейлей по первой букве - не писал
  //используйте cocktailByName - отрабатывает лучше

  ///drinks

  Future<List<Drink>> cocktailByName(String cocktailName) async {
    try {
      var url = Uri.parse(baseUrl + 'search.php?s=' + cocktailName);

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      var list = List.of(data['drinks']);
      List <Drink> listDrink = [];
      for(var i = 0; i < list.length; i++){
        DrinkDTO tempDTO = DrinkDTO.fromJson(list[i]);
        Drink tempDrink = Drink.fromDTO(tempDTO);
        listDrink.add(tempDrink);
      }
      return listDrink;
    } catch (err) {
      return <Drink>[];
    }
  }

  Future<dynamic> cocktailById(int cocktailId) async {
    try {
      var url = Uri.parse(baseUrl + 'lookup.php?i=' + cocktailId.toString());

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      final drink = Drink.fromDTO(DrinkDTO.fromJson(data['drinks']));
      return drink;
    } catch (err) {
      return null;
    }
  }

  Future<dynamic> randomCocktail() async {
    try {
      var url = Uri.parse(baseUrl + 'random.php');

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      final drink = Drink.fromDTO(DrinkDTO.fromJson(data['drinks']));
      return drink;
    } catch (err) {
      return null;
    }
  }

  //only for 2 dollars
  Future<dynamic> randomSelectionCocktail() async {
    try {
      var url = Uri.parse(baseUrl + 'randomselection.php');

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      final drink = Drink.fromDTO(DrinkDTO.fromJson(data['drinks']));
      return drink;
    } catch (err) {
      return null;
    }
  }

  ///ingredients

  Future<dynamic> ingredientByName(String ingredientName) async {
    try {
      var url = Uri.parse(baseUrl + 'search.php?i=' + ingredientName);

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      final ingredient = IngredientDTO.fromJson(data['ingredients']);
      return ingredient;
    } catch (err) {
      return null;
    }
  }

  Future<dynamic> ingredientById(int ingredientId) async {
    try {
      var url =
          Uri.parse(baseUrl + 'lookup.php?iid=' + ingredientId.toString());

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      final ingredient = IngredientDTO.fromJson(data['ingredients']);
      return ingredient;
    } catch (err) {
      return null;
    }
  }


}

  
