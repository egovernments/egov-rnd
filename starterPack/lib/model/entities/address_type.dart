// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'address_type.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum AddressType {
  @MappableValue("PERMANENT")
  permanent,
  @MappableValue("CORRESPONDENCE")
  correspondence,
  @MappableValue("OTHER")
  other,
  @MappableValue("string")
  string,
  ;
}
