// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrinkAdapter extends TypeAdapter<Drink> {
  @override
  final int typeId = 0;

  @override
  Drink read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Drink(
      name: fields[0] as String,
      id: fields[1] as int,
      alter: fields[2] as String?,
      tags: fields[3] as String?,
      video: fields[4] as String?,
      category: fields[5] as String?,
      iba: fields[6] as String?,
      alcoholic: fields[7] as DrinkType?,
      glass: fields[8] as String?,
      instructions: fields[9] as String?,
      thumb: fields[10] as String?,
      ingredients: (fields[11] as List).cast<String?>(),
      measures: (fields[12] as List).cast<String?>(),
      imgSource: fields[13] as String?,
      attribute: fields[14] as String?,
      commons: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Drink obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.alter)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.video)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.iba)
      ..writeByte(7)
      ..write(obj.alcoholic)
      ..writeByte(8)
      ..write(obj.glass)
      ..writeByte(9)
      ..write(obj.instructions)
      ..writeByte(10)
      ..write(obj.thumb)
      ..writeByte(11)
      ..write(obj.ingredients)
      ..writeByte(12)
      ..write(obj.measures)
      ..writeByte(13)
      ..write(obj.imgSource)
      ..writeByte(14)
      ..write(obj.attribute)
      ..writeByte(15)
      ..write(obj.commons);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrinkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
