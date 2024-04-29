// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_reason.dart';

class TransactionReasonMapper extends EnumMapper<TransactionReason> {
  TransactionReasonMapper._();

  static TransactionReasonMapper? _instance;
  static TransactionReasonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionReasonMapper._());
    }
    return _instance!;
  }

  static TransactionReason fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TransactionReason decode(dynamic value) {
    switch (value) {
      case "RECEIVED":
        return TransactionReason.received;
      case "RETURNED":
        return TransactionReason.returned;
      case "LOST_IN_STORAGE":
        return TransactionReason.lostInStorage;
      case "LOST_IN_TRANSIT":
        return TransactionReason.lostInTransit;
      case "DAMAGED_IN_STORAGE":
        return TransactionReason.damagedInStorage;
      case "DAMAGED_IN_TRANSIT":
        return TransactionReason.damagedInTransit;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TransactionReason self) {
    switch (self) {
      case TransactionReason.received:
        return "RECEIVED";
      case TransactionReason.returned:
        return "RETURNED";
      case TransactionReason.lostInStorage:
        return "LOST_IN_STORAGE";
      case TransactionReason.lostInTransit:
        return "LOST_IN_TRANSIT";
      case TransactionReason.damagedInStorage:
        return "DAMAGED_IN_STORAGE";
      case TransactionReason.damagedInTransit:
        return "DAMAGED_IN_TRANSIT";
    }
  }
}

extension TransactionReasonMapperExtension on TransactionReason {
  dynamic toValue() {
    TransactionReasonMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TransactionReason>(this);
  }
}
