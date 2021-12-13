import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/domain/models/drink/drink_dto.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Drink {
  @HiveField(0) final String name;
  @HiveField(1) final int id;
  @HiveField(2) final String? alter;
  @HiveField(3) final String? tags;
  @HiveField(4) final String? video;
  @HiveField(5) final String? category;
  @HiveField(6) final String? iba;
  @HiveField(7) final String? alcoholic;
  @HiveField(8) final String? glass;
  @HiveField(9) final String? instructions;
  @HiveField(10) final String? thumb;
  @HiveField(11) final List<String?> ingredients;
  @HiveField(12) final List<String?> measures;
  @HiveField(13) final String? imgSource;
  @HiveField(14) final String? attribute;
  @HiveField(15) final String? commons;

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
