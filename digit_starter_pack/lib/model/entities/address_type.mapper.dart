// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'address_type.dart';

class AddressTypeMapper extends EnumMapper<AddressType> {
  AddressTypeMapper._();

  static AddressTypeMapper? _instance;
  static AddressTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressTypeMapper._());
    }
    return _instance!;
  }

  static AddressType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AddressType decode(dynamic value) {
    switch (value) {
      case "PERMANENT":
        return AddressType.permanent;
      case "CORRESPONDENCE":
        return AddressType.correspondence;
      case "OTHER":
        return AddressType.other;
      case "string":
        return AddressType.string;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AddressType self) {
    switch (self) {
      case AddressType.permanent:
        return "PERMANENT";
      case AddressType.correspondence:
        return "CORRESPONDENCE";
      case AddressType.other:
        return "OTHER";
      case AddressType.string:
        return "string";
    }
  }
}

extension AddressTypeMapperExtension on AddressType {
  dynamic toValue() {
    AddressTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AddressType>(this);
  }
}
