// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'gender.dart';

class GenderMapper extends EnumMapper<Gender> {
  GenderMapper._();

  static GenderMapper? _instance;
  static GenderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GenderMapper._());
    }
    return _instance!;
  }

  static Gender fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Gender decode(dynamic value) {
    switch (value) {
      case "MALE":
        return Gender.male;
      case "FEMALE":
        return Gender.female;
      case "OTHER":
        return Gender.other;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Gender self) {
    switch (self) {
      case Gender.male:
        return "MALE";
      case Gender.female:
        return "FEMALE";
      case Gender.other:
        return "OTHER";
    }
  }
}

extension GenderMapperExtension on Gender {
  dynamic toValue() {
    GenderMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Gender>(this);
  }
}
