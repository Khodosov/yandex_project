import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:yandex_project/domain/models/drink.dart';
import 'package:yandex_project/domain/models/drink_dto.dart';
import 'package:yandex_project/domain/models/ingredient_dto.dart';
import 'package:yandex_project/exception/bad_request_exception.dart';
import 'package:yandex_project/exception/response_exception.dart';
import 'package:yandex_project/exception/custom_exception.dart';

class AppApisService {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: 'https://www.thecocktaildb.com/api/json/v1/1/', method: 'get'),
  );

  Future<Map<String, dynamic>?> getIpJson(
      String localPath, Map<String, String> queryParameters) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(localPath,
          queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      if (e.response == null) {
        throw ResponseException(e.response!.data.toString() + "\n" + e.response!.headers.toString() + "\n" + e.response!.requestOptions.toString());
      } else {
        throw BadRequestException(e.requestOptions.toString() + "\n" + e.message.toString());
      }
    }
  }

  ///drinks
  Future<List<Drink>> cocktailByName(String cocktailName) async {
    try {
      var data = await getIpJson('search.php', {'s': cocktailName});
      return List.of(data?['drinks'])
          .map((e) => Drink.fromDTO(DrinkDTO.fromJson(e)))
          .toList();
    } catch (err) {
      throw CustomException(err);
    }
  }

  Future<List<Drink>> cocktailById(int cocktailId) async {
    try {
      var data = await getIpJson('lookup.php', {'i': cocktailId.toString()});
      return List.of(data?['drinks'])
          .map((e) => Drink.fromDTO(DrinkDTO.fromJson(e)))
          .toList();
    } catch (err) {
      throw CustomException(err);
    }
  }

  Future<List<Drink>> randomCocktail() async {
    try {
      var data = await getIpJson('random.php', {});
      return List.of(data?['drinks'])
          .map((e) => Drink.fromDTO(DrinkDTO.fromJson(e)))
          .toList(); //List.of(data?['drinks']).map((e) => Drink.fromJson(e)).toList();
    } catch (err) {
      throw CustomException(err);
    }
  }

  ///not used yet
  //only for 2 dollars
  Future<List<Drink>> randomSelectionCocktail() async {
    try {
      var data = await getIpJson('randomselection.php', {});
      return List.of(data?['drinks'])
          .map((e) => Drink.fromDTO(DrinkDTO.fromJson(e)))
          .toList(); //List.of(data?['drinks']).map((e) => Drink.fromJson(e)).toList();
    } catch (err) {
      throw CustomException(err);
    }
  }

  var baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';


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
      return List.of(data['drinks'])
          .map((e) => Ingredient.fromJson(e))
          .toList();
    } catch (err) {
      throw CustomException(err);
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
      return List.of(data['drinks'])
          .map((e) => Ingredient.fromJson(e))
          .toList();
    } catch (err) {
      throw CustomException(err);
    }
  }
}
