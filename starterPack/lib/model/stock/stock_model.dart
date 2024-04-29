import 'package:dart_mappable/dart_mappable.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:starterPack/model/dataModel.dart';

part 'stock_model.mapper.dart';

@MappableClass()
class HcmStockSearchModel extends StockSearchModel {
  HcmStockSearchModel({
    super.id,
    super.tenantId,
    super.facilityId,
    super.productVariantId,
    super.referenceId,
    super.referenceIdType,
    super.transactingPartyId,
    super.transactingPartyType,
    super.receiverId,
    super.receiverType,
    super.senderId,
    super.senderType,
    super.clientReferenceId,
    super.transactionType,
    super.transactionReason,
  });
}

@MappableClass()
class HcmStockModel extends StockModel {
  final AuditDetails? auditDetails;
  final ClientAuditDetails? clientAuditDetails;
  final HcmStockModelAdditionalFields? additionalFields;

  HcmStockModel(
      {this.auditDetails,
      this.clientAuditDetails,
      this.additionalFields,
      super.clientReferenceId,
      super.id,
      super.tenantId,
      super.facilityId,
      super.productVariantId,
      super.referenceId,
      super.referenceIdType,
      super.transactingPartyId,
      super.transactingPartyType,
      super.quantity,
      super.waybillNumber,
      super.receiverId,
      super.receiverType,
      super.senderId,
      super.senderType,
      super.nonRecoverableError,
      super.rowVersion,
      super.transactionReason,
      super.transactionType});
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmStockModelAdditionalFields extends AdditionalFields
    with HcmStockModelAdditionalFieldsMappable {
  HcmStockModelAdditionalFields({
    super.schema = 'StockReconciliation',
    required super.version,
    super.fields,
  });
}
