import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/blocs/facility.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/blocs/product_variant.dart';
import 'package:inventory_management/models/entities/inventory_facility.dart';
import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:inventory_management/models/entities/project_resource.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/facilities/facility.dart';
import 'package:new_digit_app/model/project_staff/project_staff.dart';
import 'package:new_digit_app/model/stock/stock_model.dart';
import 'package:new_digit_app/model/user/userModel.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';
import 'package:new_digit_app/repositories/project_staff_repo.dart';
import 'package:new_digit_app/repositories/stock_repo.dart';

class HCMInventoryBloc extends InventoryListener {
  BuildContext context;
  final String? userId;
  final String uuid;
  final List<Role>? roles;
  // final String? individualId;
  // final String? projectId;
  final Map<DataModelType, Map<ApiOperation, String>>? actionMap;

  HCMInventoryBloc(
      {required this.context,
      required this.userId,
      required this.actionMap,
      required this.uuid,
      required this.roles
      // required this.individualId,
      // required this.projectId,
      });

  late Function(List<InventoryFacilityModel> facilities) _facilitiesLoaded;
  late Function(List<ProductVariantModel> productVariants)
      _productVariantsLoaded;

  FutureOr<List<ProjectStaffModel>> getProjectStaffList() async {
    try {
      return await ProjectStaffRemoteRepository().searchStaff(
          ProjectStaffSearchModel(staffId: [uuid.toString()]), actionMap);
    } catch (err) {
      rethrow;
    }
  }

  //ignore
  @override
  void callSyncMethod() {}

  @override
  Future<void> fetchFacilitiesForProjectId(
      Function(List<InventoryFacilityModel> facilitiesModel) facilities) {
    _facilitiesLoaded = facilities;

    return fetchFacilities();
  }

  Future<void> fetchFacilities() async {
    final projectStaffList = await getProjectStaffList();
    for (final projectStaff in projectStaffList) {
      if (roles!
          .map((e) => e.code == 'DISTRICT_SUPERVISOR')
          .toList()
          .isNotEmpty) {
        final facilities = context.read<FacilityBloc>()
          ..add(
              FacilityLoadForProjectEvent(projectId: projectStaff.projectId!));

        facilities.state.whenOrNull(
              fetched: (facilities) {
                _facilitiesLoaded(loadInventoryFacilities(facilities));
              },
            ) ??
            [];
      }
    }
  }

  loadInventoryFacilities(List<InventoryFacilityModel> facilities) {
    List<InventoryFacilityModel> hcmInventoryFacilityModel = [];
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
    return hcmInventoryFacilityModel;
  }

  //extra
  @override
  Future<void> fetchInventoryReports(
      FetchInventoryReports fetchInventoryReports) {
    // TODO: implement fetchInventoryReports
    throw UnimplementedError();
  }

  @override
  Future<void> fetchProductVariants(
      Function(List<ProductVariantModel> productVariantsModel)
          productVariants) {
    _productVariantsLoaded = productVariants;
    return fetchProducts();
  }

  Future<void> fetchProducts() async {
    final projectStaffList = await getProjectStaffList();
    for (final projectStaff in projectStaffList) {
      if (roles!
          .map((e) => e.code == 'DISTRICT_SUPERVISOR')
          .toList()
          .isNotEmpty) {
        final products = await context.read<ProductVariantBloc>()
          ..add(ProductVariantLoadEvent(
            query: ProjectResourceSearchModel(
              projectId: projectStaff.projectId!,
            ),
          ));

        products.state.whenOrNull(
              fetched: (productVariants) {
                _productVariantsLoaded(loadProductVariants(productVariants));
              },
            ) ??
            [];
      }
    }
  }

  List<ProductVariantModel> loadProductVariants(
    List<ProductVariantModel> productVariants,
  ) {
    List<ProductVariantModel> hcmProductVariantModel = [];

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

    return hcmProductVariantModel;
  }

  @override
  Future<void> fetchStockReconciliationDetails(
      FetchStockReconDetails fetchStockReconDetails) {
    // TODO: implement fetchStockReconciliationDetails
    throw UnimplementedError();
  }

  @override
  Future<void> handleStockReconciliationReport(
      StockReconciliationReport stockReconciliationReport) {
    // TODO: implement handleStockReconciliationReport
    throw UnimplementedError();
  }

  @override
  Future<void> saveStockDetails(SaveStockDetails saveStockDetails) async {
    //make an API call here
    //1. create a stockRemoteRepository file
    //2. write logic for sending a create type request
    //3. the body should be of the form HCMStockModel
    final stockRemoteRepository = StockRemoteRepository();

    var response = await stockRemoteRepository.create(
        HcmStockModel(
          stock: saveStockDetails.stockModel.copyWith(
            facilityId: saveStockDetails.stockModel.facilityId,
            rowVersion: 1,
            tenantId: envConfig.variables.tenantId,
          ),
          // additionalFields: StockAdditionalFields(
          //   version: 1,
          //   fields: getAdditionalData(saveStockDetails.additionalData),
          // ),
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
  }

  @override
  Future<void> saveStockReconciliationDetails(
      SaveStockReconciliationModel stockReconciliationModel) {
    // TODO: implement saveStockReconciliationDetails
    throw UnimplementedError();
  }
}
