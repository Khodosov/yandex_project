import 'package:yandex_project/domain/models/alco_enum.dart';

class Filter {
  final List<String> ingredients;
  final AlcoEnum;
  final String name;
  final int id;

  Filter({
    this.AlcoEnum,
    required this.ingredients,
    required this.name,
    required this.id,
  });
}
