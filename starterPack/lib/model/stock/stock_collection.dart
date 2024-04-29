import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:isar/isar.dart';

part 'stock_collection.g.dart';

@collection
class Stock {
  @Index()
  Id? id;
  String? facilityId;
  String? productVariantId;
  String? tenantId;
  String? referenceId;
  String? referenceIdType;
  String? transactingPartyId;
  String? transactingPartyType;
  String? receiverId;
  String? receiverType;
  String? senderId;
  String? senderType;
  String? clientReferenceId;
  @enumerated
  late TransactionType transactionType;
  @enumerated
  late TransactionReason transactionReason;
  String? waybillNumber;
  String? quantity;
  int? rowVersion;
  String? createdBy;
}
