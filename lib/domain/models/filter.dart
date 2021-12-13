import 'package:yandex_project/domain/general/enums.dart';

class Filter {
  final List<String> ingredients;
  final DrinkType drinkType;
  final String name;
  final int id;

  Filter({
    required this.drinkType,
    required this.ingredients,
    required this.name,
    required this.id,
  });
}
