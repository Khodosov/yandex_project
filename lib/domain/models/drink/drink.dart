import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/domain/models/drink/drink_dto.dart';

class Drink {
  final String name;
  final int id;
  final String? alter;
  final String? tags;
  final String? video;
  final String? category;
  final String? iba;
  final DrinkType? alcoholic;
  final String? glass;
  final String? instructions;
  final String? thumb;
  final List<String?> ingredients;
  final List<String?> measures;
  final String? imgSource;
  final String? attribute;
  final String? commons;

  Drink(
      {required this.name,
      required this.id,
      this.alter,
      this.tags,
      this.video,
      this.category,
      this.iba,
      this.alcoholic,
      this.glass,
      this.instructions,
      this.thumb,
      required this.ingredients,
      required this.measures,
      this.imgSource,
      this.attribute,
      this.commons});

  static Drink fromDTO(DrinkDTO dto) {
    return Drink(
        name: dto.strDrink,
        id: int.tryParse(dto.idDrink) ?? -1,
        alter: dto.strDrinkAlternate,
        tags: dto.strTags,
        video: dto.strVideo,
        category: dto.strCategory,
        iba: dto.strIBA,
        alcoholic: dto.strAlcoholic,
        glass: dto.strGlass,
        instructions: dto.strInstructions,
        thumb: dto.strDrinkThumb,
        imgSource: dto.strImageSource,
        attribute: dto.strImageAttribution,
        commons: dto.strCreativeCommonsConfirmed,
        ingredients: [
          dto.strIngredient1,
          dto.strIngredient2,
          dto.strIngredient3,
          dto.strIngredient4,
          dto.strIngredient5,
          dto.strIngredient6,
          dto.strIngredient7,
          dto.strIngredient8,
          dto.strIngredient9,
          dto.strIngredient10,
          dto.strIngredient11,
          dto.strIngredient12,
          dto.strIngredient13,
          dto.strIngredient14,
          dto.strIngredient15,
        ].where((ing) => ing != null && ing != '').toList(),
        measures: [
          dto.strMeasure1,
          dto.strMeasure2,
          dto.strMeasure3,
          dto.strMeasure4,
          dto.strMeasure5,
          dto.strMeasure6,
          dto.strMeasure7,
          dto.strMeasure8,
          dto.strMeasure9,
          dto.strMeasure10,
          dto.strMeasure11,
          dto.strMeasure12,
          dto.strMeasure13,
          dto.strMeasure14,
          dto.strMeasure15
        ].where((meas) => meas != null && meas != '').toList());
  }
}
