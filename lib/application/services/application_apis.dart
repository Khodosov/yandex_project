import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yandex_project/constants/api_key.dart';
import 'package:yandex_project/domain/exception/custom_exception.dart';
import 'package:yandex_project/domain/exception/failures.dart';
import 'package:yandex_project/domain/exception/request_exception.dart';
import 'package:yandex_project/domain/exception/response_exception.dart';
import 'package:yandex_project/domain/models/drink/drink.dart';
import 'package:yandex_project/domain/models/drink/drink_dto.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient.dart';

class AppApisService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://www.thecocktaildb.com/api/json/v2/${ApiKey.apiKey}/', method: 'get'),
  );

  Future<Map<String, dynamic>?> getIpJson(String localPath, Map<String, String> queryParameters) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(localPath, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      if (e.response == null) {
        throw ResponseException(e.response!.data.toString() +
            "\n" +
            e.response!.headers.toString() +
            "\n" +
            e.response!.requestOptions.toString());
      } else {
        throw RequestException(e.requestOptions.toString() + "\n" + e.message.toString());
      }
    }
  }

  ///
  /// drinks
  /// done
  ///
  Future<Either<Failure, List<Drink>>> searchByName(String cocktailName) async {
    try {
      var data = await getIpJson('search.php', {'s': cocktailName});
      return right(List.of(data?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList());
    } catch (err) {
      // Check error type end return corresponding
      return left(const Failure.serverError());
    }
  }

  Future<Either<Failure, List<Drink>>> searchByType(String drinkType) async {
    try {
      var data = await getIpJson('filter.php', {'a': drinkType});
      return right(List.of(data?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList());
    } catch (err) {
      // Check error type end return corresponding
      return left(const Failure.serverError());
    }
  }

  Future<Either<Failure, List<Drink>>> searchByIngredients(String ingredients) async {
    try {
      var data = await getIpJson('filter.php', {'i': ingredients});

      return right(List.of(data?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList());
    } catch (err) {
      // Check error type end return corresponding
      return left(const Failure.serverError());
    }
  }

  ///
  /// Useless by now
  ///
  Future<List<Drink>> cocktailById(int cocktailId) async {
    try {
      var data = await getIpJson('lookup.php', {'i': cocktailId.toString()});
      return List.of(data?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList();
    } catch (err) {
      throw CustomException(err);
    }
  }

  ///
  /// For shake
  ///
  Future<Either<Failure, List<Drink>>> randomCocktail() async {
    try {
      var data = await getIpJson('random.php', {});
      return right(List.of(data?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList());
      //List.of(data?['drinks']).map((e) => Drink.fromJson(e)).toList();
    } catch (err) {
      // Check error type end return corresponding
      return left(const Failure.serverError());
    }
  }

  ///
  /// Random button
  ///
  Future<Either<Failure, List<Drink>>> randomSelectionCocktail() async {
    try {
      var data = await getIpJson('randomselection.php', {});
      return right(List.of(data?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList());
    } catch (err) {
      // Check error type end return corresponding
      return left(const Failure.serverError());
    }
  }

  var baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';

  ///ingredients
  Future<List<Ingredient>> listIngredients() async {
    try {
      var data = await getIpJson('list.php', {'i': 'list'});
      return List.of(data?['drinks']).map((e) => Ingredient.fromJson(e)).toList();
    } catch (err) {
      return <Ingredient>[];
    }
  }

  Future<List<Ingredient>> ingredientByName(String ingredientName) async {
    try {
      var data = await getIpJson('search.php', {'i': ingredientName});
      return List.of(data!['drinks']).map((e) => Ingredient.fromJson(e)).toList();
    } catch (err) {
      throw CustomException(err);
    }
  }

  Future<List<Ingredient>> ingredientById(int ingredientId) async {
    try {
      var data = await getIpJson('lookup.php', {'iid': ingredientId.toString()});
      return List.of(data!['drinks']).map((e) => Ingredient.fromJson(e)).toList();
    } catch (err) {
      throw CustomException(err);
    }
  }
}
