import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:yandex_project/domain/models/drink.dart';

class AppApisService {

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.thecocktaildb.com/api/json/v1/1/',
      method: 'get'
    ),
  );

  Future<Map<String, dynamic>?> getIpJson(String localPath, Map<String, String> queryParameters) async {
    try {
      final response = await _dio
        .get<Map<String, dynamic>>(localPath, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
//      if (e.response) {
//        print(e.response.data);
//        print(e.response.headers);
//        print(e.response.requestOptions);
//      } else {
//        print(e.requestOptions);
//        print(e.message);
//      } .
    }
  }

  ///drinks
  Future<List<Drink>> cocktailByName(String cocktailName) async {
    try {
      var data = await getIpJson('search.php', {'s': cocktailName});
      return List.of(data ? ['drinks']).map((e) => Drink.fromJson(e)).toList();
    } catch (err) {
      return <Drink>[];
    }
  }

  Future<List<Drink>> cocktailById(int cocktailId) async {
    try {
      var data = await getIpJson('lookup.php', {'i': cocktailId.toString()});
      return List.of(data ? ['drinks']).map((e) => Drink.fromJson(e)).toList();
    } catch (err) {
      return <Drink>[];
    }
  }

  Future<dynamic> randomCocktail() async {

    try{
      var data = await getIpJson('random.php', {});
      return Drink.fromJson(data as Map<String, dynamic>); //List.of(data?['drinks']).map((e) => Drink.fromJson(e)).toList();
    } catch (err) {
      return null;
    }
  }

  var baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';

  ///drinks replaced
//  Future<List<Drink>> cocktailByName(String cocktailName) async {
//    try {
//      var url = Uri.parse(baseUrl + 'search.php?s=' + cocktailName);
//
//      var response = await http.post(
//        url,
//        headers: {},
//        body: {},
//      );
//
//      var data = json.decode(response.body);
//      return List.of(data['drinks']).map((e) => Drink.fromJson(e)).toList();
//    } catch (err) {
//      return <Drink>[];
//    }
//  }

  /// ---
//  Future<dynamic> cocktailById(int cocktailId) async {
//    try {
//      var url = Uri.parse(baseUrl + 'lookup.php?i=' + cocktailId.toString());
//
//      var response = await http.post(
//        url,
//        headers: {},
//        body: {},
//      );
//
//      var data = json.decode(response.body);
//      return data['drinks'];
//    } catch (err) {
//      return null;
//    }
//  }

  ///---
//  Future<dynamic> randomCocktail() async {
//    try {
//      var url = Uri.parse(baseUrl + 'random.php');
//
//      var response = await http.post(
//        url,
//        headers: {},
//        body: {},
//      );
//
//      var data = json.decode(response.body);
//      final drink = Drink.fromJson(data);
//      // return data['drinks'];
//      return drink;
//    } catch (err) {
//      return null;
//    }
//  }

  ///not used yet
  //only for 2 dollars
//  Future<dynamic> randomSelectionCocktail() async {
//    try {
//      var url = Uri.parse(baseUrl + 'randomselection.php');
//
//      var response = await http.post(
//        url,
//        headers: {},
//        body: {},
//      );
//
//      var data = json.decode(response.body);
//      return data['drinks'];
//    } catch (err) {
//      return null;
//    }
//  }

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
      return data['ingredients'];
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
      return data['ingredients'];
    } catch (err) {
      return null;
    }
  }
}

  
