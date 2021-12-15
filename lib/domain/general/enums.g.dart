// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrinkTypeAdapter extends TypeAdapter<DrinkType> {
  @override
  final int typeId = 3;

  @override
  DrinkType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DrinkType.alcoholic;
      case 1:
        return DrinkType.nonAlcoholic;
      case 2:
        return DrinkType.optionalAlcohol;
      default:
        return DrinkType.alcoholic;
    }
  }

  @override
  void write(BinaryWriter writer, DrinkType obj) {
    switch (obj) {
      case DrinkType.alcoholic:
        writer.writeByte(0);
        break;
      case DrinkType.nonAlcoholic:
        writer.writeByte(1);
        break;
      case DrinkType.optionalAlcohol:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrinkTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
