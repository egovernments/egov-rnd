import 'dart:async';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';
import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:inventory_management/models/entities/project_resource.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart';
import 'package:inventory_management/models/entities/transaction_reason.dart';
import 'package:inventory_management/models/entities/transaction_type.dart';
import 'package:starterPack/blocs/facilitiesComposite.dart';
import 'package:starterPack/blocs/product_variants_composite.dart';
import 'package:starterPack/data/secure_storage/secureStore.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/model/inventory/stock_reconciliation.dart';
import 'package:starterPack/model/stock/stock_model.dart';
import 'package:starterPack/model/user/userModel.dart';
import 'package:starterPack/repositories/app_init_Repo.dart';
import 'package:starterPack/repositories/local/stockLocalRepository.dart';
import 'package:starterPack/repositories/stock_reconciliation_repo.dart';
import 'package:starterPack/repositories/stock_repo.dart';

class HCMInventoryBloc extends InventoryListener {
  BuildContext context;
  final String? userId;
  final String uuid;
  final List<Role>? roles;
  final String? projectId;
  final Map<DataModelType, Map<ApiOperation, String>>? actionMap;

  HCMInventoryBloc({
    required this.context,
    required this.userId,
    required this.actionMap,
    required this.uuid,
    required this.roles,
    required this.projectId,
  });

  //ignore
  @override
  void callSyncMethod() {}

  @override
  Future<List<InventoryFacilityModel>> fetchFacilitiesForProjectId() async {
    // Function to fetch facilities for a project based on user roles
    // and populate the result into InventoryFacilityModel objects
    try {
      if (roles!
          .map((e) => e.code == 'DISTRICT_SUPERVISOR')
          .toList()
          .isNotEmpty) {
        final facilitiesBloc = context.read<FacilityCompositeBloc>()
          ..add(FacilityCompositeLoadForProjectEvent(
              projectId: projectId!, actionMap: actionMap));

        final facilitiesState = await facilitiesBloc.stream.firstWhere(
            (state) => state.maybeWhen(
                orElse: () => false, fetched: (facilities) => true));

        List<InventoryFacilityModel> hcmInventoryFacilityModel = [];
        facilitiesState.maybeWhen(
          fetched: (facilities) {
            for (var element in facilities) {
              hcmInventoryFacilityModel.add(
                InventoryFacilityModel(
                  id: element.id,
                  isPermanent: element.isPermanent,
                  nonRecoverableError: element.nonRecoverableError,
                  rowVersion: element.rowVersion,
                  storageCapacity: element.storageCapacity,
                  tenantId: element.tenantId,
                  usage: element.usage,
                ),
              );
            }
          },
          orElse: () {},
        );

        return hcmInventoryFacilityModel;
      } else {
        return [];
      }
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  @override
  Future<List<ProductVariantModel>> fetchProductVariants() async {
    // Function to fetch product variants based on user roles
    // and populate the result into ProductVariantModel objects
    if (roles!
        .map((e) => e.code == 'DISTRICT_SUPERVISOR')
        .toList()
        .isNotEmpty) {
      //Created a composite class called productVariantCompositeBloc because
      //the Bloc in the inventory package does not make an API call

      final productsBloc = context.read<ProductVariantCompositeBloc>()
        ..add(ProductVariantCompositeLoadEvent(
            query: ProjectResourceSearchModel(
              projectId: projectId!,
            ),
            actionMap: actionMap));

      final productVariantsState = await productsBloc.stream.firstWhere(
        (state) => state.maybeWhen(
          fetched: (productVariants) => true,
          orElse: () => false,
        ),
      );

      List<ProductVariantModel> hcmProductVariantModel = [];
      productVariantsState.maybeWhen(
        fetched: (productVariants) {
          for (var element in productVariants) {
            hcmProductVariantModel.add(
              ProductVariantModel(
                id: element.id,
                variation: element.variation,
                rowVersion: element.rowVersion,
                tenantId: element.tenantId,
                nonRecoverableError: element.nonRecoverableError,
                productId: element.productId,
                sku: element.sku,
              ),
            );
          }
        },
        orElse: () {},
      );

      return hcmProductVariantModel;
    } else {
      return [];
    }
  }

  // Helper function to convert additional data map into AdditionalField objects
  getAdditionalData(Map<String, Object> additionalData) {
    List<AdditionalField> additionalFields = [];

    additionalData.forEach((key, value) {
      additionalFields.add(AdditionalField(key, value));
    });

    return additionalFields;
  }

  @override
  Future<Map<String, List<StockModel>>> fetchInventoryReports(
      {InventoryReportType? reportType,
      String? facilityId,
      String? productVariantId}) async {
    if (reportType == InventoryReportType.reconciliation) {
      throw Exception(
        'Invalid report type: ${reportType}',
      );
    }

    List<TransactionReason>? transactionReason;
    List<TransactionType>? transactionType;
    String? senderId;
    String? receiverId;

    if (reportType == InventoryReportType.receipt) {
      transactionType = [TransactionType.received];
      transactionReason = [TransactionReason.received];
      receiverId = facilityId;
      senderId = null;
    } else if (reportType == InventoryReportType.dispatch) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [];
      receiverId = null;
      senderId = facilityId;
    } else if (reportType == InventoryReportType.returned) {
      transactionType = [TransactionType.received];
      transactionReason = [TransactionReason.returned];
      receiverId = null;
      senderId = facilityId;
    } else if (reportType == InventoryReportType.damage) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [
        TransactionReason.damagedInStorage,
        TransactionReason.damagedInTransit,
      ];
      receiverId = facilityId;
      senderId = null;
    } else if (reportType == InventoryReportType.loss) {
      transactionType = [TransactionType.dispatched];
      transactionReason = [
        TransactionReason.lostInStorage,
        TransactionReason.lostInTransit,
      ];
      receiverId = facilityId;
      senderId = null;
    }
    final user = await SecureStore().getAccessInfo();

    final data = (receiverId != null
            ? await StockRemoteRepository().search(
                HcmStockSearchModel(
                  transactionType: transactionType,
                  tenantId: envConfig.variables.tenantId,
                  receiverId: receiverId,
                  productVariantId: productVariantId,
                  transactionReason: transactionReason,
                ),
                actionMap)
            : await StockRemoteRepository().search(
                HcmStockSearchModel(
                  transactionType: transactionType,
                  tenantId: envConfig.variables.tenantId,
                  senderId: senderId,
                  productVariantId: productVariantId,
                  transactionReason: transactionReason,
                ),
                actionMap))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == user?.userRequest?.uuid);

    final filteredData =
        data.where((e) => e.receiverId != null && e.senderId != null);

    final groupedData = filteredData.groupListsBy(
      (element) => DateFormat('dd MMM yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(
          element.auditDetails!.createdTime!,
        ),
      ),
    );

    return groupedData;
  }

  @override
  Future<List<List<StockModel>>> fetchStockReconciliationDetails(
      {String? productVariantId, String? facilityId}) async {
    // Function to fetch stock reconciliation details based on the specified parameters
    // and populate the result into the provided callback function
    final List<HcmStockModel> sentStocks = (await StockRemoteRepository()
            .search(
                HcmStockSearchModel(
                    facilityId: facilityId, productVariantId: productVariantId),
                actionMap))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == uuid)
        .toList();

    final List<HcmStockModel> receivedStocks = (await StockRemoteRepository()
            .search(
                HcmStockSearchModel(
                    facilityId: facilityId, productVariantId: productVariantId),
                actionMap))
        .where((element) =>
            element.auditDetails != null &&
            element.auditDetails?.createdBy == uuid)
        .toList();

    if (sentStocks.isEmpty && receivedStocks.isEmpty) {
      final sentStocks = await StockLocalRepository()
          .getStocks(productVariantId!, facilityId!);

      final receivedStocks =
          await StockLocalRepository().getStocks(productVariantId, facilityId);

      return [sentStocks, receivedStocks];
    }

    return [sentStocks, receivedStocks];
  }

  @override
  Future<bool> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel) async {
    // Function to save stock reconciliation details based on the provided parameters
    // and notify the caller about the completion status
    await StockReconciliationRemoteRepository().create(
        HcmStockReconciliationModel(
          calculatedCount:
              stockReconciliationModel.stockReconciliationModel.calculatedCount,
          commentsOnReconciliation: stockReconciliationModel
              .stockReconciliationModel.commentsOnReconciliation,
          facilityId:
              stockReconciliationModel.stockReconciliationModel.facilityId,
          id: stockReconciliationModel.stockReconciliationModel.id,
          nonRecoverableError: stockReconciliationModel
              .stockReconciliationModel.nonRecoverableError,
          physicalCount:
              stockReconciliationModel.stockReconciliationModel.physicalCount,
          productVariantId: stockReconciliationModel
              .stockReconciliationModel.productVariantId,
          rowVersion:
              stockReconciliationModel.stockReconciliationModel.rowVersion,
          tenantId: envConfig.variables.tenantId,
          referenceId: projectId,
          referenceIdType: 'PROJECT',
          clientReferenceId: stockReconciliationModel
              .stockReconciliationModel.clientReferenceId,
          dateOfReconciliation: stockReconciliationModel
              .stockReconciliationModel.dateOfReconciliation,
          additionalFields: StockReconciliationAdditionalFields(
            version: 1,
            fields: getAdditionalData(stockReconciliationModel.additionalData),
          ),
          auditDetails: AuditDetails(
              createdBy: userId.toString(),
              createdTime: DateTime.now().millisecondsSinceEpoch),
          clientAuditDetails: ClientAuditDetails(
            createdBy: userId.toString(),
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: userId.toString(),
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
          ),
        ),
        actionMap);

    return true;
  }

  @override
  Future<StockReconciliationReport> handleStockReconciliationReport(
      {String? facilityId, String? productVariantId}) async {
    // Function to handle stock reconciliation report and populate the result
    // into the provided callback function
    final Iterable<HcmStockReconciliationModel> data =
        await StockReconciliationRemoteRepository().search(
            StockReconciliationSearchModel(
                tenantId: envConfig.variables.tenantId,
                facilityId: facilityId,
                productVariantId: productVariantId),
            actionMap);

    final groupedData = data
        .groupListsBy((element) =>
            DateFormat('dd MMM yyyy').format(element.dateOfReconciliationTime))
        .map((key, value) {
      return MapEntry(key, value);
    });

    final additionalData = data.map((e) => e.additionalFields).toList();
    var moreDetails = additionalData.map((e) => e?.fields).toList();
    var additionalFields = moreDetails.expand((e) => e!.map((e) {
          return MapEntry(e.key, e.value);
        }));

    return StockReconciliationReport(
      stockReconModel: groupedData,
      additionalData: additionalFields,
    );
  }

  @override
  Future<bool> saveStockDetails(SaveStockDetails saveStockDetails) async {
    // Function to save stock details based on the provided parameters
    // and notify the caller about the completion status
    final stockToSave = HcmStockModel(
      clientReferenceId: saveStockDetails.stockModel.clientReferenceId,
      nonRecoverableError: saveStockDetails.stockModel.nonRecoverableError,
      id: saveStockDetails.stockModel.id,
      productVariantId: saveStockDetails.stockModel.productVariantId,
      quantity: saveStockDetails.stockModel.quantity,
      receiverId: saveStockDetails.stockModel.receiverId,
      receiverType: saveStockDetails.stockModel.receiverType,
      referenceId: saveStockDetails.stockModel.referenceId,
      referenceIdType: saveStockDetails.stockModel.referenceIdType,
      senderId: saveStockDetails.stockModel.senderId,
      senderType: saveStockDetails.stockModel.senderType,
      transactingPartyId: saveStockDetails.stockModel.transactingPartyId,
      transactingPartyType: saveStockDetails.stockModel.transactingPartyType,
      transactionReason: saveStockDetails.stockModel.transactionReason,
      transactionType: saveStockDetails.stockModel.transactionType,
      waybillNumber: saveStockDetails.stockModel.waybillNumber,
      facilityId: saveStockDetails.stockModel.facilityId,
      rowVersion: 1,
      tenantId: envConfig.variables.tenantId,
      additionalFields: HcmStockModelAdditionalFields(
        version: 1,
        fields: getAdditionalData(saveStockDetails.additionalData),
      ),
      auditDetails: AuditDetails(
          createdBy: userId.toString(),
          createdTime: DateTime.now().millisecondsSinceEpoch),
      clientAuditDetails: ClientAuditDetails(
        createdBy: userId.toString(),
        createdTime: DateTime.now().millisecondsSinceEpoch,
        lastModifiedBy: userId.toString(),
        lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
      ),
    );

    await StockRemoteRepository().create(stockToSave, actionMap);

    await StockLocalRepository().saveStocks(stockToSave);

    return true;
  }
}
