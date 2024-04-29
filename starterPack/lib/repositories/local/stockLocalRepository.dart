import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:isar/isar.dart';
import 'package:starterPack/model/stock/stock_collection.dart';
import 'package:starterPack/model/stock/stock_model.dart';
import 'package:starterPack/utils/constants.dart';

class StockLocalRepository {
  //save stocks to ISAR
  Future<void> saveStocks(HcmStockModel stock) async {
    final isar = await Constants().isar;

    final newStock = Stock()
      ..clientReferenceId = stock.clientReferenceId
      ..facilityId = stock.facilityId
      ..id = stock.id as Id?
      ..receiverId = stock.receiverId
      ..receiverType = stock.receiverType
      ..referenceId = stock.referenceId
      ..referenceIdType = stock.referenceIdType
      ..senderId = stock.senderId
      ..senderType = stock.senderType
      ..transactingPartyId = stock.transactingPartyId
      ..transactingPartyType = stock.transactingPartyType
      ..transactionReason =
          stock.transactionReason ?? TransactionReason.received
      ..transactionType = stock.transactionType!
      ..waybillNumber = stock.waybillNumber
      ..productVariantId = stock.productVariantId
      ..quantity = stock.quantity
      ..tenantId = stock.tenantId
      ..rowVersion = stock.rowVersion
      ..createdBy = stock.auditDetails?.createdBy;

    await isar.writeTxn(() async {
      await isar.stocks.put(newStock);
    });

    Stream<void> userChanged = isar!.stocks.watchObjectLazy(5);
    userChanged.listen((void _) {
      print('Created stock');
    });
  }

  Future<List<HcmStockModel>> getStocks(
      String productVariantId, String facilityId) async {
    final isar = await Constants().isar;
    final stocks = (await isar!.stocks
        .filter()
        .productVariantIdEqualTo(productVariantId)
        .facilityIdEqualTo(facilityId)
        .findAll());

    return stocks.map((stock) {
      return HcmStockModel(
        clientReferenceId: stock.clientReferenceId,
        id: stock.id.toString(),
        productVariantId: stock.productVariantId,
        quantity: stock.quantity,
        receiverId: stock.receiverId,
        receiverType: stock.receiverType,
        referenceId: stock.referenceId,
        referenceIdType: stock.referenceIdType,
        senderId: stock.senderId,
        senderType: stock.senderType,
        transactingPartyId: stock.transactingPartyId,
        transactingPartyType: stock.transactingPartyType,
        transactionReason: stock.transactionReason != null
            ? TransactionReason.values[stock.transactionReason.index]
            : null,
        transactionType: stock.transactionType,
        waybillNumber: stock.waybillNumber,
        facilityId: stock.facilityId,
        rowVersion: stock.rowVersion,
      );
    }).toList();
  }
}
