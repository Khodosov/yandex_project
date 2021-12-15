import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enums.g.dart';

enum AppTab {
  favorites,
  home,
  search,
  random,
  settings,
}

@HiveType(typeId: 3)
enum DrinkType {
  @JsonValue('Alcoholic')
  @HiveField(0) alcoholic,
  @JsonValue('Non alcoholic')
  @HiveField(1) nonAlcoholic,
  @JsonValue('Optional alcohol')
  @HiveField(2) optionalAlcohol
}

extension ParseToString on AppTab {
  String fromEnum() {
    return toString().split('.').last[0].toUpperCase() + toString().split('.').last.substring(1);
  }
}

extension DrinkTypeToString on DrinkType {
  String fromEnum() {
    final drinkType = toString().split('.').last;
    switch (drinkType) {
      case 'alcoholic':
        return 'Alcoholic';
      case 'nonAlcoholic':
        return 'Non alcoholic';
      case 'optionalAlcohol':
        return 'Optional Alcohol';
      default:
        return '';
    }
  }
}

