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
      return List.of(data['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList();
    } catch (err) {
      return <Drink>[];
    }
  }

  Future<List<Drink>> cocktailById(int cocktailId) async {
    try {
      var url = Uri.parse(baseUrl + 'lookup.php?i=' + cocktailId.toString());

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      return List.of(data['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList();
    } catch (err) {
      return <Drink>[];
    }
  }

  Future<List<Drink>> randomCocktail() async {
    try {
      var url = Uri.parse(baseUrl + 'random.php');

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      return List.of(data['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList();
    } catch (err) {
      return <Drink>[];
    }
  }

  //only for 2 dollars
  Future<List<Drink>> randomSelectionCocktail() async {
    try {
      var url = Uri.parse(baseUrl + 'randomselection.php');

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      return List.of(data['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList();
    } catch (err) {
      return <Drink>[];
    }
  }

  ///ingredients

  Future<List<Ingredient>> ingredientByName(String ingredientName) async {
    try {
      var url = Uri.parse(baseUrl + 'search.php?i=' + ingredientName);

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      return List.of(data['drinks']).map((e) => Ingredient.fromJson(e)).toList();
    } catch (err) {
      return <Ingredient>[];
    }
  }

  Future<List<Ingredient>> ingredientById(int ingredientId) async {
    try {
      var url =
          Uri.parse(baseUrl + 'lookup.php?iid=' + ingredientId.toString());

      var response = await http.post(
        url,
        headers: {},
        body: {},
      );

      var data = json.decode(response.body);
      return List.of(data['drinks']).map((e) => Ingredient.fromJson(e)).toList();
    } catch (err) {
      return <Ingredient>[];
    }
  }


}

  
