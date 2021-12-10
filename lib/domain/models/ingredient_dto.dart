import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class Ingredient {
  final String name;
  final int id;

  Ingredient({required this.name, required this.id});

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
