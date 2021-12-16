import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:yandex_project/constants/api_key.dart';
import 'package:yandex_project/domain/exception/custom_exception.dart';
import 'package:yandex_project/domain/exception/failures.dart';
import 'package:yandex_project/domain/exception/request_exception.dart';
import 'package:yandex_project/domain/models/drink/drink.dart';
import 'package:yandex_project/domain/models/drink/drink_dto.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient.dart';

class AppApisService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://www.thecocktaildb.com/api/json/v2/${ApiKey.apiKey}/', method: 'get'),
  );

  Future<Either<Failure, Map<String, dynamic>?>> getIpJson(
      String localPath, Map<String, String> queryParameters) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(localPath, queryParameters: queryParameters);
      return right(response.data);
    } on DioError catch (e) {
      if (e.response == null) {
        return left(const Failure.badConnection());
      } else if (e.response!.statusCode == 500) {
        return left(const Failure.badConnection());
      } else if (e.response!.statusCode == 404) {
        return left(const Failure.notFound());
      } else {
        return left(const Failure.serverError());
      }
    }
  }

  ///
  /// drinks
  /// done
  ///
  Future<Either<Failure, List<Drink>>> searchByName(String cocktailName) async {
    try {
      late final Either<Failure, List<Drink>> result;
      final data = await getIpJson('search.php', {'s': cocktailName});
      data.fold((l) {
        result = left(l);
      }, (r) {
        result = right(List.of(r?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList());
      });
      return result;
    } catch (err) {
      // Check error type end return corresponding
      return left(const Failure.serverError());
    }
  }

  Future<Either<Failure, List<Drink>>> searchByType(String drinkType) async {
    try {
      final data = await getIpJson('filter.php', {'a': drinkType});
      late final Either<Failure, List<Drink>> result;
      data.fold((l) {
        result = left(l);
      }, (r) {
        result = right(List.of(r?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList());
      });
      return result;
    } catch (err) {
      // Check error type end return corresponding
      return left(const Failure.serverError());
    }
  }

  Future<Either<Failure, List<Drink>>> searchByIngredients(String ingredients) async {
    try {
      final data = await getIpJson('filter.php', {'i': ingredients});
      late final Either<Failure, List<Drink>> result;
      data.fold((l) {
        result = left(l);
      }, (r) {
        result = right(List.of(r?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList());
      });
      return result;
    } catch (err) {
      // Check error type end return corresponding
      return left(const Failure.serverError());
    }
  }

  ///
  /// Useless by now
  ///
  // Future<List<Drink>> cocktailById(int cocktailId) async {
  //   try {
  //     var data = await getIpJson('lookup.php', {'i': cocktailId.toString()});
  //     return List.of(data?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList();
  //   } catch (err) {
  //     throw CustomException(err);
  //   }
  // }

  ///
  /// For shake
  ///
  Future<Either<Failure, List<Drink>>> randomCocktail() async {
    try {
      final data = await getIpJson('random.php', {});
      late final Either<Failure, List<Drink>> result;
      data.fold((l) {
        result = left(l);
      }, (r) {
        result = right(List.of(r?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList());
      });
      return result;
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
      late final Either<Failure, List<Drink>> result;
      data.fold((l) {
        result = left(l);
      }, (r) {
        result = right(List.of(r?['drinks']).map((e) => Drink.fromDTO(DrinkDTO.fromJson(e))).toList());
      });
      return result;
    } catch (err) {
      // Check error type end return corresponding
      return left(const Failure.serverError());
    }
  }

  var baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';

  ///ingredients
  Future<List<Ingredient>> listIngredients() async {
    try {
      final data = await getIpJson('list.php', {'i': 'list'});
      late final Either<Failure, List<Ingredient>> result;
      data.fold((l) {
        result = left(l);
      }, (r) {
        result = right(List.of(r?['drinks']).map((e) => Ingredient.fromJson(e)).toList());
      });
      return result.getOrElse(() => <Ingredient>[]);
    } catch (err) {
      return <Ingredient>[];
    }
  }

  Future<List<Ingredient>> ingredientByName(String ingredientName) async {
    try {
      final data = await getIpJson('search.php', {'i': ingredientName});
      late final Either<Failure, List<Ingredient>> result;
      data.fold((l) {
        result = left(l);
      }, (r) {
        result = right(List.of(r?['drinks']).map((e) => Ingredient.fromJson(e)).toList());
      });
      return result.getOrElse(() => <Ingredient>[]);
    } catch (err) {
      throw CustomException(err);
    }
  }

  Future<List<Ingredient>> ingredientById(int ingredientId) async {
    try {
      final data = await getIpJson('lookup.php', {'iid': ingredientId.toString()});
      late final Either<Failure, List<Ingredient>> result;
      data.fold((l) {
        result = left(l);
      }, (r) {
        result = right(List.of(r?['drinks']).map((e) => Ingredient.fromJson(e)).toList());
      });
      return result.getOrElse(() => <Ingredient>[]);
    } catch (err) {
      throw CustomException(err);
    }
  }
}
