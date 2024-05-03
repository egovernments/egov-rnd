// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mdms_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MdmsHiveModelAdapter extends TypeAdapter<MdmsHiveModel> {
  @override
  final int typeId = 1;

  @override
  MdmsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MdmsHiveModel(
      name: fields[0] as String,
      code: fields[1] as String,
      languages: (fields[2] as List).cast<LanguageHiveModel>(),
      cityHive: (fields[3] as List).cast<CityHiveModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MdmsHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.languages)
      ..writeByte(3)
      ..write(obj.cityHive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MdmsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LanguageHiveModelAdapter extends TypeAdapter<LanguageHiveModel> {
  @override
  final int typeId = 2;

  @override
  LanguageHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguageHiveModel(
      label: fields[0] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LanguageHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CityHiveModelAdapter extends TypeAdapter<CityHiveModel> {
  @override
  final int typeId = 5;

  @override
  CityHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityHiveModel(
      cityCode: fields[0] as String,
      cityName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CityHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.cityCode)
      ..writeByte(1)
      ..write(obj.cityName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
