import 'package:json_annotation/json_annotation.dart';

part 'drink_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class DrinkDTO {
  final String strDrink;
  final String idDrink;
  final String? strDrinkAlternate;
  final String? strTags;
  final String? strVideo;
  final String? strCategory;
  final String? strIBA;
  final String? strAlcoholic;
  final String? strGlass;
  final String? strInstructions;
  final String? strDrinkThumb;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strIngredient6;
  final String? strIngredient7;
  final String? strIngredient8;
  final String? strIngredient9;
  final String? strIngredient10;
  final String? strIngredient11;
  final String? strIngredient12;
  final String? strIngredient13;
  final String? strIngredient14;
  final String? strIngredient15;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  final String? strMeasure6;
  final String? strMeasure7;
  final String? strMeasure8;
  final String? strMeasure9;
  final String? strMeasure10;
  final String? strMeasure11;
  final String? strMeasure12;
  final String? strMeasure13;
  final String? strMeasure14;
  final String? strMeasure15;
  final String? strImageSource;
  final String? strImageAttribution;
  final String? strCreativeCommonsConfirmed;

  DrinkDTO({
    required this.strDrink,
    required this.idDrink,
    this.strDrinkAlternate,
    this.strTags,
    this.strVideo,
    this.strCategory,
    this.strIBA,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strDrinkThumb,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strImageSource,
    this.strImageAttribution,
    this.strCreativeCommonsConfirmed,
  });

  factory DrinkDTO.fromJson(Map<String, dynamic> json) => _$DrinkDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkDTOToJson(this);

  List<String> getIngredients(){
    final result = <String>[];
    if (strIngredient1 != null){
      result.add(strIngredient1!);
    }
    if (strIngredient2 != null){
      result.add(strIngredient2!);
    }
    if (strIngredient3 != null){
      result.add(strIngredient3!);
    }
    if (strIngredient4 != null){
      result.add(strIngredient4!);
    }
    if (strIngredient5 != null) {
      result.add(strIngredient5!);
    }
    if (strIngredient6 != null){
      result.add(strIngredient6!);
    }
    if (strIngredient7 != null){
      result.add(strIngredient7!);
    }
    if (strIngredient8 != null){
      result.add(strIngredient8!);
    }
    if (strIngredient9 != null){
      result.add(strIngredient9!);
    }
    if (strIngredient10 != null){
      result.add(strIngredient10!);
    }
    if (strIngredient11 != null){
      result.add(strIngredient11!);
    }
    if (strIngredient12 != null){
      result.add(strIngredient12!);
    }
    if (strIngredient13 != null){
      result.add(strIngredient13!);
    }
    if (strIngredient14 != null){
      result.add(strIngredient14!);
    }
    if (strIngredient15 != null){
      result.add(strIngredient15!);
    }
    return result;
  }
}
