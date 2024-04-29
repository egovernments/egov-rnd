import 'package:referral_reconciliation/models/entities/referral_recon_attributes.dart';
import 'package:referral_reconciliation/models/entities/referral_recon_service_attributes.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/model/entities/project_facility.dart';
import 'package:starterPack/model/entities/roles_type.dart';
import 'package:starterPack/model/projects/project.dart';
import 'package:starterPack/model/referral/referral.dart';
import 'package:starterPack/repositories/project_facility_repo.dart';
import 'package:starterPack/repositories/referral_reconciliation_repo.dart';
import 'package:starterPack/repositories/service.dart';

class HFReferralBloc extends ReferralReconListener {
  Map<DataModelType, Map<ApiOperation, String>> actionMap;
  String tenantId;
  ProjectModel selectedProject;
  List<String> checklistTypes;

  HFReferralBloc(
      {required this.actionMap,
      required this.tenantId,
      required this.selectedProject,
      required this.checklistTypes});
  @override
  void callSyncMethod() {
    // TODO: implement callSyncMethod
  }

  @override
  Future<List<ReferralProjectFacilityModel>>
      fetchProjectFacilitiesForProjectId() async {
    final projectFacilities = await ProjectFacilityRemoteRepository().search(
        ProjectFacilitySearchModel(
            projectId: [selectedProject.id], tenantId: 'mz'),
        actionMap);

    final referralProjectFacilities = projectFacilities
        .map((e) => ReferralProjectFacilityModel(
            facilityId: e.facilityId,
            id: e.id,
            projectId: [selectedProject.id],
            tenantId: e.tenantId))
        .toList();

    return referralProjectFacilities;
  }

  @override
  Future<List<ReferralReconciliation>> fetchReferralReconciliations(
      SearchReferralReconciliationClass searchReferralReconciliation) async {
    final beneficiaries = await ReferralReconciliationRemoteRepository().search(
        //search for beneficiaries
        HFReferralSearchModel(
            name: searchReferralReconciliation.name,
            projectId: selectedProject.id,
            tenantId: tenantId,
            beneficiaryId: searchReferralReconciliation.tag),
        actionMap);

    return beneficiaries
        .map((e) => ReferralReconciliation(
            hfReferralModel: HcmHFReferralModel(
                clientReferenceId: e.clientReferenceId,
                id: e.id,
                name: e.name,
                projectId: e.projectId,
                tenantId: e.tenantId,
                beneficiaryId: e.beneficiaryId,
                referralCode: e.referralCode,
                symptomSurveyId: e.symptomSurveyId,
                projectFacilityId: e.projectFacilityId,
                nationalLevelId: e.nationalLevelId,
                symptom: e.symptom,
                additionalFields: e.additionalFields),
            additionalData: e.additionalFields!.toMap() as Map<String, Object>))
        .toList();
  }

  @override
  Future<ReferralReconServiceModel?> fetchSavedChecklist(
      ReferralReconServiceSearchModel reconServiceSearchModel) async {
    final selectedChecklist = await ServiceRemoteRepository()
        .fetchServices(actionMap, reconServiceSearchModel);

    return selectedChecklist.isNotEmpty
        ? ReferralReconServiceModel(
            clientId: selectedChecklist.first.clientId,
            serviceDefId: selectedChecklist.first.serviceDefId,
            accountId: selectedChecklist.first.accountId,
            createdAt: selectedChecklist.first.createdAt,
            tenantId: selectedChecklist.first.tenantId,
            attributes: selectedChecklist.first.attributes
                ?.map((e) => ReferralReconServiceAttributesModel(
                    clientReferenceId: e.clientReferenceId,
                    attributeCode: e.attributeCode,
                    value: e.value,
                    dataType: e.dataType,
                    referenceId: e.referenceId,
                    tenantId: e.tenantId,
                    rowVersion: e.rowVersion,
                    additionalDetails: e.additionalDetails,
                    nonRecoverableError: e.nonRecoverableError))
                .toList())
        : null;
  }

  @override
  Future<bool> saveReferralReconDetails(
      ReferralReconciliation saveReferralReconciliation) async {
    try {
      await ReferralReconciliationRemoteRepository().create(
          HcmHFReferralModel(
            auditDetails: AuditDetails(
                createdBy: 'mz',
                createdTime: DateTime.now().millisecondsSinceEpoch),
            clientReferenceId:
                saveReferralReconciliation.hfReferralModel.clientReferenceId,
            id: saveReferralReconciliation.hfReferralModel.id,
            name: saveReferralReconciliation.hfReferralModel.name,
            projectId: saveReferralReconciliation.hfReferralModel.projectId,
            tenantId: saveReferralReconciliation.hfReferralModel.tenantId,
            beneficiaryId:
                saveReferralReconciliation.hfReferralModel.beneficiaryId,
            referralCode:
                saveReferralReconciliation.hfReferralModel.referralCode,
            symptomSurveyId:
                saveReferralReconciliation.hfReferralModel.symptomSurveyId,
            projectFacilityId:
                saveReferralReconciliation.hfReferralModel.projectFacilityId,
            nationalLevelId:
                saveReferralReconciliation.hfReferralModel.nationalLevelId,
            symptom: saveReferralReconciliation.hfReferralModel.symptom,
            additionalFields: ReferralAdditionalFields(
                version: 1,
                fields: getAdditionalFields(saveReferralReconciliation
                    .additionalData)), //additionalFields
          ),
          actionMap);
    } catch (e) {
      return false;
    }
    return true;
  }

  List<AdditionalField> getAdditionalFields(
      Map<String, Object> additionalData) {
    List<AdditionalField> additionalFields = [];
    additionalData.forEach((key, value) {
      additionalFields.add(AdditionalField(key, value));
    });
    return additionalFields;
  }

  @override
  Future<bool> saveServiceRequestDetails(
      SaveServiceRequest saveServiceRequest) async {
    try {
      await ServiceRemoteRepository()
          .create(actionMap, saveServiceRequest.serviceModel);
    } catch (e) {
      return false;
    }
    return true;
  }

  @override
  Future<List<ReferralReconServiceDefinitionModel>>
      fetchAllServiceDefinitions() async {
    List<String> codes = [];
    checklistTypes.map((e) => e).forEach((element) {
      codes.add(
          '${selectedProject.name}.$element.${RolesType.healthFacilityWorker.toValue()}');
    });
    final allServiceDefinitions = await ServiceRemoteRepository()
        .fetchServiceDefinitions(
            actionMap,
            ReferralReconServiceDefinitionSearchModel(
                tenantId: tenantId, code: codes));
    return allServiceDefinitions
        .map((e) => ReferralReconServiceDefinitionModel(
            id: e.id,
            tenantId: e.tenantId,
            code: e.code,
            attributes: e.attributes
                ?.map((a) => ReferralReconAttributesModel(
                      id: a.id,
                      code: a.code,
                      tenantId: a.tenantId,
                      isActive: a.isActive,
                      dataType: a.dataType,
                      referenceId: a.referenceId,
                      required: a.required,
                      values: a.values,
                      order: a.order,
                      regex: a.regex,
                    ))
                .toList()))
        .toList();
  }

  @override
  Future<List<ReferralReconServiceDefinitionModel>>
      fetchSelectedServiceDefinitions(String code) async {
    final selectedServiceDefinition =
        await ServiceRemoteRepository().fetchServiceDefinitions(
      actionMap,
      ReferralReconServiceDefinitionSearchModel(tenantId: tenantId, code: [
        '${selectedProject.name}.HF_RF_$code.${RolesType.healthFacilityWorker.toValue()}'
      ]),
    );
    return selectedServiceDefinition
        .map((e) => ReferralReconServiceDefinitionModel(
            id: e.id,
            tenantId: e.tenantId,
            code: e.code,
            attributes: e.attributes
                ?.map((a) => ReferralReconAttributesModel(
                      id: a.id,
                      code: a.code,
                      tenantId: a.tenantId,
                      isActive: a.isActive,
                      dataType: a.dataType,
                      referenceId: a.referenceId,
                      required: a.required,
                      values: a.values,
                      order: a.order,
                      regex: a.regex,
                    ))
                .toList()))
        .toList(); // Convert Iterable to List
  }
}
