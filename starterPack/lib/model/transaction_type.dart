import 'package:dart_mappable/dart_mappable.dart';

part 'transaction_type.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum TransactionType {
  @MappableValue("RECEIVED") received,
  @MappableValue("DISPATCHED") dispatched,
  ;
}