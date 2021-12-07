import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppApisService {

  var baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';

  //Список всех коктейлей по первой букве - не писал
  //используйте cocktailByName - отрабатывает лучше


  ///drinks

  Future<dynamic> cocktailByName(String cocktailName) async {
    try {
      var url = Uri.parse(baseUrl + 'search.php?s=' + cocktailName);

      var response = await http.post(
        url,
        headers: {
        },
        body: {
        },
      );

      var data = json.decode(response.body);
      print(data['drinks']);
      return data['drinks'];

    } catch (err) {
      return null;
    }
  }

  Future<dynamic> cocktailById(int cocktailId) async {
    try {
      var url = Uri.parse(baseUrl + 'lookup.php?i=' + cocktailId.toString());

      var response = await http.post(
        url,
        headers: {
        },
        body: {
        },
      );

      var data = json.decode(response.body);
      return data['drinks'];

    } catch (err) {
      return null;
    }
  }

  Future<dynamic> randomCocktail() async {
    try {
      var url = Uri.parse(baseUrl + 'random.php');

      var response = await http.post(
        url,
        headers: {
        },
        body: {
        },
      );

      var data = json.decode(response.body);
      return data['drinks'];

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
        headers: {
        },
        body: {
        },
      );

      var data = json.decode(response.body);
      return data['drinks'];

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
        headers: {
        },
        body: {
        },
      );

      var data = json.decode(response.body);
      return data['ingredients'];

    } catch (err) {
      return null;
    }
  }

  Future<dynamic> ingredientById(int ingredientId) async {
    try {
      var url = Uri.parse(baseUrl + 'lookup.php?iid=' + ingredientId.toString());

      var response = await http.post(
        url,
        headers: {
        },
        body: {
        },
      );

      var data = json.decode(response.body);
      return data['ingredients'];

    } catch (err) {
      return null;
    }
  }

  
}