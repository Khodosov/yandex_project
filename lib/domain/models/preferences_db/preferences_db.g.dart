// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreferencesDBAdapter extends TypeAdapter<PreferencesDB> {
  @override
  final int typeId = 2;

  @override
  PreferencesDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PreferencesDB(
      themeMode: fields[0] as ThemeMode,
      nonAlcoholicMode: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PreferencesDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.themeMode)
      ..writeByte(1)
      ..write(obj.nonAlcoholicMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreferencesDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
