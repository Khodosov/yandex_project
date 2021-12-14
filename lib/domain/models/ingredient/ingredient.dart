import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient.g.dart';


@JsonSerializable(explicitToJson: true, includeIfNull: true)
@HiveType(typeId: 1)
class Ingredient {

  @HiveField(0)
  final String name;

  Ingredient({required this.name});

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
