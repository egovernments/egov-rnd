// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_type.dart';

class TransactionTypeMapper extends EnumMapper<TransactionType> {
  TransactionTypeMapper._();

  static TransactionTypeMapper? _instance;
  static TransactionTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionTypeMapper._());
    }
    return _instance!;
  }

  static TransactionType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TransactionType decode(dynamic value) {
    switch (value) {
      case "RECEIVED":
        return TransactionType.received;
      case "DISPATCHED":
        return TransactionType.dispatched;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TransactionType self) {
    switch (self) {
      case TransactionType.received:
        return "RECEIVED";
      case TransactionType.dispatched:
        return "DISPATCHED";
    }
  }
}

extension TransactionTypeMapperExtension on TransactionType {
  dynamic toValue() {
    TransactionTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TransactionType>(this);
  }
}
