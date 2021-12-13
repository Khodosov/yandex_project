import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient_dto.dart';

part 'filter.freezed.dart';

@freezed
class Filter with _$Filter {
  const factory Filter({
    List<Ingredient>? ingredients,
    List<DrinkType>? drinkType,
    String? name,
    int? id,
  }) = _Filter;
}
