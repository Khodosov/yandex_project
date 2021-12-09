import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class IngredientDTO {
  final String name;
  final int id;

  IngredientDTO({required this.name, required this.id});

  factory IngredientDTO.fromJson(Map<String, dynamic> json) =>
      _$IngredientDTOFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDTOToJson(this);
}
