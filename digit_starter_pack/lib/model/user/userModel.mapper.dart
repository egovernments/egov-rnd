// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'userModel.dart';

class UserSearchModelMapper extends ClassMapperBase<UserSearchModel> {
  UserSearchModelMapper._();

  static UserSearchModelMapper? _instance;
  static UserSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserSearchModel';

  static String? _$id(UserSearchModel v) => v.id;
  static const Field<UserSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$userName(UserSearchModel v) => v.userName;
  static const Field<UserSearchModel, String> _f$userName =
      Field('userName', _$userName, opt: true);
  static List<String>? _$uuid(UserSearchModel v) => v.uuid;
  static const Field<UserSearchModel, List<String>> _f$uuid =
      Field('uuid', _$uuid, opt: true);

  @override
  final MappableFields<UserSearchModel> fields = const {
    #id: _f$id,
    #userName: _f$userName,
    #uuid: _f$uuid,
  };
  @override
  final bool ignoreNull = true;

  static UserSearchModel _instantiate(DecodingData data) {
    return UserSearchModel(
        id: data.dec(_f$id),
        userName: data.dec(_f$userName),
        uuid: data.dec(_f$uuid));
  }

  @override
  final Function instantiate = _instantiate;

  static UserSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSearchModel>(map);
  }

  static UserSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserSearchModel>(json);
  }
}

mixin UserSearchModelMappable {
  String toJson() {
    return UserSearchModelMapper.ensureInitialized()
        .encodeJson<UserSearchModel>(this as UserSearchModel);
  }

  Map<String, dynamic> toMap() {
    return UserSearchModelMapper.ensureInitialized()
        .encodeMap<UserSearchModel>(this as UserSearchModel);
  }

  UserSearchModelCopyWith<UserSearchModel, UserSearchModel, UserSearchModel>
      get copyWith => _UserSearchModelCopyWithImpl(
          this as UserSearchModel, $identity, $identity);
  @override
  String toString() {
    return UserSearchModelMapper.ensureInitialized()
        .stringifyValue(this as UserSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserSearchModelMapper.ensureInitialized()
                .isValueEqual(this as UserSearchModel, other));
  }

  @override
  int get hashCode {
    return UserSearchModelMapper.ensureInitialized()
        .hashValue(this as UserSearchModel);
  }
}

extension UserSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSearchModel, $Out> {
  UserSearchModelCopyWith<$R, UserSearchModel, $Out> get $asUserSearchModel =>
      $base.as((v, t, t2) => _UserSearchModelCopyWithImpl(v, t, t2));
}

abstract class UserSearchModelCopyWith<$R, $In extends UserSearchModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get uuid;
  $R call({String? id, String? userName, List<String>? uuid});
  UserSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSearchModel, $Out>
    implements UserSearchModelCopyWith<$R, UserSearchModel, $Out> {
  _UserSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSearchModel> $mapper =
      UserSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get uuid =>
      $value.uuid != null
          ? ListCopyWith($value.uuid!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(uuid: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? userName = $none,
          Object? uuid = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (userName != $none) #userName: userName,
        if (uuid != $none) #uuid: uuid
      }));
  @override
  UserSearchModel $make(CopyWithData data) => UserSearchModel(
      id: data.get(#id, or: $value.id),
      userName: data.get(#userName, or: $value.userName),
      uuid: data.get(#uuid, or: $value.uuid));

  @override
  UserSearchModelCopyWith<$R2, UserSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserSearchModelCopyWithImpl($value, $cast, t);
}

class UserModelMapper extends ClassMapperBase<UserModel> {
  UserModelMapper._();

  static UserModelMapper? _instance;
  static UserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserModelMapper._());
      RoleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserModel';

  static String? _$id(UserModel v) => v.id;
  static const Field<UserModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$userName(UserModel v) => v.userName;
  static const Field<UserModel, String> _f$userName =
      Field('userName', _$userName, opt: true);
  static String? _$salutation(UserModel v) => v.salutation;
  static const Field<UserModel, String> _f$salutation =
      Field('salutation', _$salutation, opt: true);
  static String? _$name(UserModel v) => v.name;
  static const Field<UserModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$gender(UserModel v) => v.gender;
  static const Field<UserModel, String> _f$gender =
      Field('gender', _$gender, opt: true);
  static String? _$mobileNumber(UserModel v) => v.mobileNumber;
  static const Field<UserModel, String> _f$mobileNumber =
      Field('mobileNumber', _$mobileNumber, opt: true);
  static String? _$emailId(UserModel v) => v.emailId;
  static const Field<UserModel, String> _f$emailId =
      Field('emailId', _$emailId, opt: true);
  static String? _$altContactNumber(UserModel v) => v.altContactNumber;
  static const Field<UserModel, String> _f$altContactNumber =
      Field('altContactNumber', _$altContactNumber, opt: true);
  static String? _$pan(UserModel v) => v.pan;
  static const Field<UserModel, String> _f$pan = Field('pan', _$pan, opt: true);
  static String? _$aadhaarNumber(UserModel v) => v.aadhaarNumber;
  static const Field<UserModel, String> _f$aadhaarNumber =
      Field('aadhaarNumber', _$aadhaarNumber, opt: true);
  static String? _$permanentAddress(UserModel v) => v.permanentAddress;
  static const Field<UserModel, String> _f$permanentAddress =
      Field('permanentAddress', _$permanentAddress, opt: true);
  static String? _$permanentCity(UserModel v) => v.permanentCity;
  static const Field<UserModel, String> _f$permanentCity =
      Field('permanentCity', _$permanentCity, opt: true);
  static String? _$permanentPinCode(UserModel v) => v.permanentPinCode;
  static const Field<UserModel, String> _f$permanentPinCode =
      Field('permanentPinCode', _$permanentPinCode, opt: true);
  static String? _$correspondenceAddress(UserModel v) =>
      v.correspondenceAddress;
  static const Field<UserModel, String> _f$correspondenceAddress =
      Field('correspondenceAddress', _$correspondenceAddress, opt: true);
  static String? _$correspondenceCity(UserModel v) => v.correspondenceCity;
  static const Field<UserModel, String> _f$correspondenceCity =
      Field('correspondenceCity', _$correspondenceCity, opt: true);
  static String? _$correspondencePinCode(UserModel v) =>
      v.correspondencePinCode;
  static const Field<UserModel, String> _f$correspondencePinCode =
      Field('correspondencePinCode', _$correspondencePinCode, opt: true);
  static String? _$alternatemobilenumber(UserModel v) =>
      v.alternatemobilenumber;
  static const Field<UserModel, String> _f$alternatemobilenumber =
      Field('alternatemobilenumber', _$alternatemobilenumber, opt: true);
  static bool? _$active(UserModel v) => v.active;
  static const Field<UserModel, bool> _f$active =
      Field('active', _$active, opt: true);
  static String? _$locale(UserModel v) => v.locale;
  static const Field<UserModel, String> _f$locale =
      Field('locale', _$locale, opt: true);
  static String? _$type(UserModel v) => v.type;
  static const Field<UserModel, String> _f$type =
      Field('type', _$type, opt: true);
  static bool? _$accountLocked(UserModel v) => v.accountLocked;
  static const Field<UserModel, bool> _f$accountLocked =
      Field('accountLocked', _$accountLocked, opt: true);
  static int? _$accountLockedDate(UserModel v) => v.accountLockedDate;
  static const Field<UserModel, int> _f$accountLockedDate =
      Field('accountLockedDate', _$accountLockedDate, opt: true);
  static String? _$fatherOrHusbandName(UserModel v) => v.fatherOrHusbandName;
  static const Field<UserModel, String> _f$fatherOrHusbandName =
      Field('fatherOrHusbandName', _$fatherOrHusbandName, opt: true);
  static String? _$relationship(UserModel v) => v.relationship;
  static const Field<UserModel, String> _f$relationship =
      Field('relationship', _$relationship, opt: true);
  static String? _$signature(UserModel v) => v.signature;
  static const Field<UserModel, String> _f$signature =
      Field('signature', _$signature, opt: true);
  static String? _$bloodGroup(UserModel v) => v.bloodGroup;
  static const Field<UserModel, String> _f$bloodGroup =
      Field('bloodGroup', _$bloodGroup, opt: true);
  static String? _$photo(UserModel v) => v.photo;
  static const Field<UserModel, String> _f$photo =
      Field('photo', _$photo, opt: true);
  static String? _$identificationMark(UserModel v) => v.identificationMark;
  static const Field<UserModel, String> _f$identificationMark =
      Field('identificationMark', _$identificationMark, opt: true);
  static int? _$createdBy(UserModel v) => v.createdBy;
  static const Field<UserModel, int> _f$createdBy =
      Field('createdBy', _$createdBy, opt: true);
  static String? _$lastModifiedBy(UserModel v) => v.lastModifiedBy;
  static const Field<UserModel, String> _f$lastModifiedBy =
      Field('lastModifiedBy', _$lastModifiedBy, opt: true);
  static String? _$tenantId(UserModel v) => v.tenantId;
  static const Field<UserModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$uuid(UserModel v) => v.uuid;
  static const Field<UserModel, String> _f$uuid =
      Field('uuid', _$uuid, opt: true);
  static String? _$createdDate(UserModel v) => v.createdDate;
  static const Field<UserModel, String> _f$createdDate =
      Field('createdDate', _$createdDate, opt: true);
  static bool? _$nonRecoverableError(UserModel v) => v.nonRecoverableError;
  static const Field<UserModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static int? _$rowVersion(UserModel v) => v.rowVersion;
  static const Field<UserModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static List<Role>? _$roles(UserModel v) => v.roles;
  static const Field<UserModel, List<Role>> _f$roles =
      Field('roles', _$roles, opt: true);

  @override
  final MappableFields<UserModel> fields = const {
    #id: _f$id,
    #userName: _f$userName,
    #salutation: _f$salutation,
    #name: _f$name,
    #gender: _f$gender,
    #mobileNumber: _f$mobileNumber,
    #emailId: _f$emailId,
    #altContactNumber: _f$altContactNumber,
    #pan: _f$pan,
    #aadhaarNumber: _f$aadhaarNumber,
    #permanentAddress: _f$permanentAddress,
    #permanentCity: _f$permanentCity,
    #permanentPinCode: _f$permanentPinCode,
    #correspondenceAddress: _f$correspondenceAddress,
    #correspondenceCity: _f$correspondenceCity,
    #correspondencePinCode: _f$correspondencePinCode,
    #alternatemobilenumber: _f$alternatemobilenumber,
    #active: _f$active,
    #locale: _f$locale,
    #type: _f$type,
    #accountLocked: _f$accountLocked,
    #accountLockedDate: _f$accountLockedDate,
    #fatherOrHusbandName: _f$fatherOrHusbandName,
    #relationship: _f$relationship,
    #signature: _f$signature,
    #bloodGroup: _f$bloodGroup,
    #photo: _f$photo,
    #identificationMark: _f$identificationMark,
    #createdBy: _f$createdBy,
    #lastModifiedBy: _f$lastModifiedBy,
    #tenantId: _f$tenantId,
    #uuid: _f$uuid,
    #createdDate: _f$createdDate,
    #nonRecoverableError: _f$nonRecoverableError,
    #rowVersion: _f$rowVersion,
    #roles: _f$roles,
  };
  @override
  final bool ignoreNull = true;

  static UserModel _instantiate(DecodingData data) {
    return UserModel(
        id: data.dec(_f$id),
        userName: data.dec(_f$userName),
        salutation: data.dec(_f$salutation),
        name: data.dec(_f$name),
        gender: data.dec(_f$gender),
        mobileNumber: data.dec(_f$mobileNumber),
        emailId: data.dec(_f$emailId),
        altContactNumber: data.dec(_f$altContactNumber),
        pan: data.dec(_f$pan),
        aadhaarNumber: data.dec(_f$aadhaarNumber),
        permanentAddress: data.dec(_f$permanentAddress),
        permanentCity: data.dec(_f$permanentCity),
        permanentPinCode: data.dec(_f$permanentPinCode),
        correspondenceAddress: data.dec(_f$correspondenceAddress),
        correspondenceCity: data.dec(_f$correspondenceCity),
        correspondencePinCode: data.dec(_f$correspondencePinCode),
        alternatemobilenumber: data.dec(_f$alternatemobilenumber),
        active: data.dec(_f$active),
        locale: data.dec(_f$locale),
        type: data.dec(_f$type),
        accountLocked: data.dec(_f$accountLocked),
        accountLockedDate: data.dec(_f$accountLockedDate),
        fatherOrHusbandName: data.dec(_f$fatherOrHusbandName),
        relationship: data.dec(_f$relationship),
        signature: data.dec(_f$signature),
        bloodGroup: data.dec(_f$bloodGroup),
        photo: data.dec(_f$photo),
        identificationMark: data.dec(_f$identificationMark),
        createdBy: data.dec(_f$createdBy),
        lastModifiedBy: data.dec(_f$lastModifiedBy),
        tenantId: data.dec(_f$tenantId),
        uuid: data.dec(_f$uuid),
        createdDate: data.dec(_f$createdDate),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion),
        roles: data.dec(_f$roles));
  }

  @override
  final Function instantiate = _instantiate;

  static UserModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserModel>(map);
  }

  static UserModel fromJson(String json) {
    return ensureInitialized().decodeJson<UserModel>(json);
  }
}

mixin UserModelMappable {
  String toJson() {
    return UserModelMapper.ensureInitialized()
        .encodeJson<UserModel>(this as UserModel);
  }

  Map<String, dynamic> toMap() {
    return UserModelMapper.ensureInitialized()
        .encodeMap<UserModel>(this as UserModel);
  }

  UserModelCopyWith<UserModel, UserModel, UserModel> get copyWith =>
      _UserModelCopyWithImpl(this as UserModel, $identity, $identity);
  @override
  String toString() {
    return UserModelMapper.ensureInitialized()
        .stringifyValue(this as UserModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            UserModelMapper.ensureInitialized()
                .isValueEqual(this as UserModel, other));
  }

  @override
  int get hashCode {
    return UserModelMapper.ensureInitialized().hashValue(this as UserModel);
  }
}

extension UserModelValueCopy<$R, $Out> on ObjectCopyWith<$R, UserModel, $Out> {
  UserModelCopyWith<$R, UserModel, $Out> get $asUserModel =>
      $base.as((v, t, t2) => _UserModelCopyWithImpl(v, t, t2));
}

abstract class UserModelCopyWith<$R, $In extends UserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Role, RoleCopyWith<$R, Role, Role>>? get roles;
  $R call(
      {String? id,
      String? userName,
      String? salutation,
      String? name,
      String? gender,
      String? mobileNumber,
      String? emailId,
      String? altContactNumber,
      String? pan,
      String? aadhaarNumber,
      String? permanentAddress,
      String? permanentCity,
      String? permanentPinCode,
      String? correspondenceAddress,
      String? correspondenceCity,
      String? correspondencePinCode,
      String? alternatemobilenumber,
      bool? active,
      String? locale,
      String? type,
      bool? accountLocked,
      int? accountLockedDate,
      String? fatherOrHusbandName,
      String? relationship,
      String? signature,
      String? bloodGroup,
      String? photo,
      String? identificationMark,
      int? createdBy,
      String? lastModifiedBy,
      String? tenantId,
      String? uuid,
      String? createdDate,
      bool? nonRecoverableError,
      int? rowVersion,
      List<Role>? roles});
  UserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserModel, $Out>
    implements UserModelCopyWith<$R, UserModel, $Out> {
  _UserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserModel> $mapper =
      UserModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Role, RoleCopyWith<$R, Role, Role>>? get roles =>
      $value.roles != null
          ? ListCopyWith($value.roles!, (v, t) => v.copyWith.$chain(t),
              (v) => call(roles: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? userName = $none,
          Object? salutation = $none,
          Object? name = $none,
          Object? gender = $none,
          Object? mobileNumber = $none,
          Object? emailId = $none,
          Object? altContactNumber = $none,
          Object? pan = $none,
          Object? aadhaarNumber = $none,
          Object? permanentAddress = $none,
          Object? permanentCity = $none,
          Object? permanentPinCode = $none,
          Object? correspondenceAddress = $none,
          Object? correspondenceCity = $none,
          Object? correspondencePinCode = $none,
          Object? alternatemobilenumber = $none,
          Object? active = $none,
          Object? locale = $none,
          Object? type = $none,
          Object? accountLocked = $none,
          Object? accountLockedDate = $none,
          Object? fatherOrHusbandName = $none,
          Object? relationship = $none,
          Object? signature = $none,
          Object? bloodGroup = $none,
          Object? photo = $none,
          Object? identificationMark = $none,
          Object? createdBy = $none,
          Object? lastModifiedBy = $none,
          Object? tenantId = $none,
          Object? uuid = $none,
          Object? createdDate = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none,
          Object? roles = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (userName != $none) #userName: userName,
        if (salutation != $none) #salutation: salutation,
        if (name != $none) #name: name,
        if (gender != $none) #gender: gender,
        if (mobileNumber != $none) #mobileNumber: mobileNumber,
        if (emailId != $none) #emailId: emailId,
        if (altContactNumber != $none) #altContactNumber: altContactNumber,
        if (pan != $none) #pan: pan,
        if (aadhaarNumber != $none) #aadhaarNumber: aadhaarNumber,
        if (permanentAddress != $none) #permanentAddress: permanentAddress,
        if (permanentCity != $none) #permanentCity: permanentCity,
        if (permanentPinCode != $none) #permanentPinCode: permanentPinCode,
        if (correspondenceAddress != $none)
          #correspondenceAddress: correspondenceAddress,
        if (correspondenceCity != $none)
          #correspondenceCity: correspondenceCity,
        if (correspondencePinCode != $none)
          #correspondencePinCode: correspondencePinCode,
        if (alternatemobilenumber != $none)
          #alternatemobilenumber: alternatemobilenumber,
        if (active != $none) #active: active,
        if (locale != $none) #locale: locale,
        if (type != $none) #type: type,
        if (accountLocked != $none) #accountLocked: accountLocked,
        if (accountLockedDate != $none) #accountLockedDate: accountLockedDate,
        if (fatherOrHusbandName != $none)
          #fatherOrHusbandName: fatherOrHusbandName,
        if (relationship != $none) #relationship: relationship,
        if (signature != $none) #signature: signature,
        if (bloodGroup != $none) #bloodGroup: bloodGroup,
        if (photo != $none) #photo: photo,
        if (identificationMark != $none)
          #identificationMark: identificationMark,
        if (createdBy != $none) #createdBy: createdBy,
        if (lastModifiedBy != $none) #lastModifiedBy: lastModifiedBy,
        if (tenantId != $none) #tenantId: tenantId,
        if (uuid != $none) #uuid: uuid,
        if (createdDate != $none) #createdDate: createdDate,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (roles != $none) #roles: roles
      }));
  @override
  UserModel $make(CopyWithData data) => UserModel(
      id: data.get(#id, or: $value.id),
      userName: data.get(#userName, or: $value.userName),
      salutation: data.get(#salutation, or: $value.salutation),
      name: data.get(#name, or: $value.name),
      gender: data.get(#gender, or: $value.gender),
      mobileNumber: data.get(#mobileNumber, or: $value.mobileNumber),
      emailId: data.get(#emailId, or: $value.emailId),
      altContactNumber:
          data.get(#altContactNumber, or: $value.altContactNumber),
      pan: data.get(#pan, or: $value.pan),
      aadhaarNumber: data.get(#aadhaarNumber, or: $value.aadhaarNumber),
      permanentAddress:
          data.get(#permanentAddress, or: $value.permanentAddress),
      permanentCity: data.get(#permanentCity, or: $value.permanentCity),
      permanentPinCode:
          data.get(#permanentPinCode, or: $value.permanentPinCode),
      correspondenceAddress:
          data.get(#correspondenceAddress, or: $value.correspondenceAddress),
      correspondenceCity:
          data.get(#correspondenceCity, or: $value.correspondenceCity),
      correspondencePinCode:
          data.get(#correspondencePinCode, or: $value.correspondencePinCode),
      alternatemobilenumber:
          data.get(#alternatemobilenumber, or: $value.alternatemobilenumber),
      active: data.get(#active, or: $value.active),
      locale: data.get(#locale, or: $value.locale),
      type: data.get(#type, or: $value.type),
      accountLocked: data.get(#accountLocked, or: $value.accountLocked),
      accountLockedDate:
          data.get(#accountLockedDate, or: $value.accountLockedDate),
      fatherOrHusbandName:
          data.get(#fatherOrHusbandName, or: $value.fatherOrHusbandName),
      relationship: data.get(#relationship, or: $value.relationship),
      signature: data.get(#signature, or: $value.signature),
      bloodGroup: data.get(#bloodGroup, or: $value.bloodGroup),
      photo: data.get(#photo, or: $value.photo),
      identificationMark:
          data.get(#identificationMark, or: $value.identificationMark),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      lastModifiedBy: data.get(#lastModifiedBy, or: $value.lastModifiedBy),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      uuid: data.get(#uuid, or: $value.uuid),
      createdDate: data.get(#createdDate, or: $value.createdDate),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      roles: data.get(#roles, or: $value.roles));

  @override
  UserModelCopyWith<$R2, UserModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserModelCopyWithImpl($value, $cast, t);
}

class RoleMapper extends ClassMapperBase<Role> {
  RoleMapper._();

  static RoleMapper? _instance;
  static RoleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RoleMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Role';

  static String? _$code(Role v) => v.code;
  static const Field<Role, String> _f$code = Field('code', _$code);
  static String? _$name(Role v) => v.name;
  static const Field<Role, String> _f$name = Field('name', _$name);
  static String? _$tenantId(Role v) => v.tenantId;
  static const Field<Role, String> _f$tenantId = Field('tenantId', _$tenantId);

  @override
  final MappableFields<Role> fields = const {
    #code: _f$code,
    #name: _f$name,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static Role _instantiate(DecodingData data) {
    return Role(
        code: data.dec(_f$code),
        name: data.dec(_f$name),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static Role fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Role>(map);
  }

  static Role fromJson(String json) {
    return ensureInitialized().decodeJson<Role>(json);
  }
}

mixin RoleMappable {
  String toJson() {
    return RoleMapper.ensureInitialized().encodeJson<Role>(this as Role);
  }

  Map<String, dynamic> toMap() {
    return RoleMapper.ensureInitialized().encodeMap<Role>(this as Role);
  }

  RoleCopyWith<Role, Role, Role> get copyWith =>
      _RoleCopyWithImpl(this as Role, $identity, $identity);
  @override
  String toString() {
    return RoleMapper.ensureInitialized().stringifyValue(this as Role);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RoleMapper.ensureInitialized().isValueEqual(this as Role, other));
  }

  @override
  int get hashCode {
    return RoleMapper.ensureInitialized().hashValue(this as Role);
  }
}

extension RoleValueCopy<$R, $Out> on ObjectCopyWith<$R, Role, $Out> {
  RoleCopyWith<$R, Role, $Out> get $asRole =>
      $base.as((v, t, t2) => _RoleCopyWithImpl(v, t, t2));
}

abstract class RoleCopyWith<$R, $In extends Role, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? code, String? name, String? tenantId});
  RoleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RoleCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Role, $Out>
    implements RoleCopyWith<$R, Role, $Out> {
  _RoleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Role> $mapper = RoleMapper.ensureInitialized();
  @override
  $R call(
          {Object? code = $none,
          Object? name = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (code != $none) #code: code,
        if (name != $none) #name: name,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  Role $make(CopyWithData data) => Role(
      code: data.get(#code, or: $value.code),
      name: data.get(#name, or: $value.name),
      tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  RoleCopyWith<$R2, Role, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RoleCopyWithImpl($value, $cast, t);
}
