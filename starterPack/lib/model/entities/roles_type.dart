// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'roles_type.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum RolesType {
  @MappableValue("WAREHOUSE_MANAGER")
  warehouseManager,
  @MappableValue("DISTRIBUTOR")
  distributor,
  @MappableValue("HEALTH_FACILITY_WORKER")
  healthFacilityWorker,
  @MappableValue("DISTRICT_SUPERVISOR")
  districtSupervisor,
  @MappableValue("FIELD_SUPERVISOR")
  fieldSupervisor,
  @MappableValue("SUPERUSER")
  superuser,
  @MappableValue("REGISTRAR")
  registrar,
  ;
}
