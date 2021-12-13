import 'package:json_annotation/json_annotation.dart';

enum AppTab {
  favorites,
  home,
  search,
  random,
  settings,
}

enum DrinkType {
  @JsonValue('Alcoholic')
  alcoholic,
  @JsonValue('Non alcoholic')
  nonAlcoholic,
  @JsonValue('Optional alcoholic')
  optionalAlcoholic
}

extension ParseToString on AppTab {
  String fromEnum() {
    return toString().split('.').last[0].toUpperCase() +
        toString().split('.').last.substring(1);
  }
}

extension DrinkToString on DrinkType {
  String fromEnum() {
    final drinkType = toString().split('.').last;
    switch (drinkType) {
      case 'alcoholic':
        return 'Alcoholic';
      case 'nonAlcoholic':
        return 'Non alcoholic';
      case 'optionalAlcoholic':
        return 'Optional Alcoholic';
      default:
        return '';
    }
  }
}
