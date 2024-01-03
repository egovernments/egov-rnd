// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalizationHiveModelAdapter extends TypeAdapter<LocalizationHiveModel> {
  @override
  final int typeId = 0;

  @override
  LocalizationHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalizationHiveModel(
      code: fields[0] as String,
      message: fields[1] as String,
      locale: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalizationHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizationHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
