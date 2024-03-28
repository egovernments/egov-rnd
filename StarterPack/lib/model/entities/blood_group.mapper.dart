// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'blood_group.dart';

class BloodGroupMapper extends EnumMapper<BloodGroup> {
  BloodGroupMapper._();

  static BloodGroupMapper? _instance;
  static BloodGroupMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BloodGroupMapper._());
    }
    return _instance!;
  }

  static BloodGroup fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BloodGroup decode(dynamic value) {
    switch (value) {
      case "A+":
        return BloodGroup.aPositive;
      case "B+":
        return BloodGroup.bPositive;
      case "O+":
        return BloodGroup.oPositive;
      case "AB+":
        return BloodGroup.abPositive;
      case "A-":
        return BloodGroup.aNegative;
      case "B-":
        return BloodGroup.bNegative;
      case "AB-":
        return BloodGroup.abNegative;
      case "O-":
        return BloodGroup.oNegative;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BloodGroup self) {
    switch (self) {
      case BloodGroup.aPositive:
        return "A+";
      case BloodGroup.bPositive:
        return "B+";
      case BloodGroup.oPositive:
        return "O+";
      case BloodGroup.abPositive:
        return "AB+";
      case BloodGroup.aNegative:
        return "A-";
      case BloodGroup.bNegative:
        return "B-";
      case BloodGroup.abNegative:
        return "AB-";
      case BloodGroup.oNegative:
        return "O-";
    }
  }
}

extension BloodGroupMapperExtension on BloodGroup {
  dynamic toValue() {
    BloodGroupMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BloodGroup>(this);
  }
}
