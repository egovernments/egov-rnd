import 'package:attendance_management/router/attendance_router.dart';
import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/router/inventory_router.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';
import 'package:starterPack/blocs/app_localization.dart';
import 'package:starterPack/pages/authenticated.dart';
import 'package:starterPack/pages/home.dart';
import 'package:starterPack/pages/langSelection.dart';
import 'package:starterPack/pages/loginPage.dart';
import 'package:starterPack/pages/profile.dart';
import 'package:starterPack/pages/projectSelection.dart';
import 'package:starterPack/pages/unauthenticated.dart';

part 'routes.gr.dart';

@AutoRouterConfig(
    modules: [InventoryRoute, AttendanceRoute, ReferralReconciliationRoute])
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: UnauthenticatedRouteWrapper.page, path: '/', children: [
          AutoRoute(page: LoginRoute.page, path: 'login'),
          AutoRoute(
              page: SelectLanguageRoute.page, initial: true, path: 'langscreen')
        ]),
        AutoRoute(page: AuthenticatedRouteWrapper.page, path: '/', children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(page: ProfileRoute.page, path: 'profile'),
          AutoRoute(
              page: ProjectSelectionRoute.page,
              path: 'projects',
              initial: true),
          AutoRoute(page: ManageAttendanceRoute.page),
          AutoRoute(
            page: AttendanceDateSessionSelectionRoute.page,
          ),
          AutoRoute(
            page: MarkAttendanceRoute.page,
          ),
          AutoRoute(page: AttendanceAcknowledgementRoute.page),
          AutoRoute(
            page: ManageStocksRoute.page,
            path: 'manage-stocks',
          ),
          AutoRoute(
              page: RecordStockWrapperRoute.page,
              path: 'record-stock',
              children: [
                AutoRoute(
                    page: WarehouseDetailsRoute.page,
                    path: 'warehouse-details',
                    initial: true),
                AutoRoute(page: StockDetailsRoute.page, path: 'details'),
              ]),
          AutoRoute(
              page: InventoryFacilitySelectionRoute.page,
              path: 'inventory-select-facilities'),
          AutoRoute(
              page: StockReconciliationRoute.page,
              path: 'stock-reconciliation'),
          AutoRoute(
              page: InventoryReportSelectionRoute.page,
              path: 'inventory-report-selection'),
          AutoRoute(
              page: InventoryReportDetailsRoute.page,
              path: 'inventory-report-details'),
          AutoRoute(
              page: InventoryAcknowledgementRoute.page,
              path: 'inventory-acknowledgement'),
          AutoRoute(
            page: SearchReferralReconciliationsRoute.page,
            path: 'search-referrals',
          ),
          AutoRoute(
            page: ReferralReconProjectFacilitySelectionRoute.page,
            path: 'referral-project-facility',
          ),
          AutoRoute(
              page: HFCreateReferralWrapperRoute.page,
              path: 'referral-reconciliation',
              children: [
                AutoRoute(
                    page: ReferralFacilityRoute.page,
                    path: 'facility-details',
                    initial: true),
                AutoRoute(
                    page: RecordReferralDetailsRoute.page,
                    path: 'referral-details'),
                AutoRoute(
                  page: ReferralReasonChecklistRoute.page,
                  path: 'referral-checklist-create',
                ),
                AutoRoute(
                  page: ReferralReasonChecklistPreviewRoute.page,
                  path: 'referral-checklist-view',
                ),
              ]),
          AutoRoute(
            page: ReferralReconAcknowledgementRoute.page,
            path: 'referral-acknowledgement',
          ),
        ])
      ];
}
