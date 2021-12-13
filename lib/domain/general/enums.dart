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
