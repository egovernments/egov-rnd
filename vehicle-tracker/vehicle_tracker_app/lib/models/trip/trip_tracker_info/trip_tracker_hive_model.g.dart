// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_tracker_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripHiveModelAdapter extends TypeAdapter<TripHiveModel> {
  @override
  final int typeId = 3;

  @override
  TripHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TripHiveModel(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
      timestamp: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TripHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
