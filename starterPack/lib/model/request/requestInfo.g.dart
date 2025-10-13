// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requestInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestInfoModelImpl _$$RequestInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestInfoModelImpl(
      apiId: json['apiId'] as String?,
      ver: json['ver'] as String?,
      ts: json['ts'] as num?,
      action: json['action'] as String?,
      did: json['did'] as String?,
      key: json['key'] as String?,
      msgId: json['msgId'] as String?,
      authToken: json['authToken'] as String?,
    );

Map<String, dynamic> _$$RequestInfoModelImplToJson(
    _$RequestInfoModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiId', instance.apiId);
  writeNotNull('ver', instance.ver);
  writeNotNull('ts', instance.ts);
  writeNotNull('action', instance.action);
  writeNotNull('did', instance.did);
  writeNotNull('key', instance.key);
  writeNotNull('msgId', instance.msgId);
  writeNotNull('authToken', instance.authToken);
  return val;
}
