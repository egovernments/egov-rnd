import 'package:dart_mappable/dart_mappable.dart';
import 'package:referral_reconciliation/models/entities/h_f_referral.dart';
import 'package:starterPack/model/dataModel.dart';

part 'referral.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class HcmHFReferralModel extends HFReferralModel
    with HcmHFReferralModelMappable {
  ReferralAdditionalFields? additionalFields;
  AuditDetails? auditDetails;
  ClientAuditDetails? clientAuditDetails;
  HcmHFReferralModel(
      {super.id,
      super.tenantId,
      super.name,
      super.projectId,
      super.projectFacilityId,
      super.symptomSurveyId,
      super.beneficiaryId,
      super.referralCode,
      super.nationalLevelId,
      super.symptom,
      super.nonRecoverableError = false,
      required super.clientReferenceId,
      super.rowVersion,
      this.additionalFields,
      this.auditDetails,
      this.clientAuditDetails})
      : super();
}

@MappableClass()
class ReferralAdditionalFields extends AdditionalFields
    with ReferralAdditionalFieldsMappable {
  ReferralAdditionalFields(
      {super.fields, super.schema, required super.version});
}
