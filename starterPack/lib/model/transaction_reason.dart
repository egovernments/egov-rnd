import 'package:dart_mappable/dart_mappable.dart';

part 'transaction_reason.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum TransactionReason {
  @MappableValue("RECEIVED")
  received,
  @MappableValue("RETURNED")
  returned,
  @MappableValue("LOST_IN_STORAGE")
  lostInStorage,
  @MappableValue("LOST_IN_TRANSIT")
  lostInTransit,
  @MappableValue("DAMAGED_IN_STORAGE")
  damagedInStorage,
  @MappableValue("DAMAGED_IN_TRANSIT")
  damagedInTransit,
  ;
}
