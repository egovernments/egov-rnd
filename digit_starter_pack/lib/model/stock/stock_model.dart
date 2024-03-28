// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:new_digit_app/model/dataModel.dart';

part 'stock_model.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmStockSearchModel with HcmStockSearchModelMappable {
  final StockSearchModel? stock;

  HcmStockSearchModel({
    this.stock,
  });

  @MappableConstructor()
  HcmStockSearchModel.ignoreDeleted(
    this.stock,
  ) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmStockModel with HcmStockModelMappable {
  final StockModel? stock;
  final AuditDetails? auditDetails;
  final ClientAuditDetails? clientAuditDetails;

  HcmStockModel({this.stock, this.auditDetails, this.clientAuditDetails});
}
