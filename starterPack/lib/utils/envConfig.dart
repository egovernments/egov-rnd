import 'dart:async';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

EnvironmentConfiguration envConfig = EnvironmentConfiguration.instance;

class EnvironmentConfiguration {
  static final EnvironmentConfiguration _instance =
      EnvironmentConfiguration._internal();

  static EnvironmentConfiguration get instance => _instance;

  EnvironmentConfiguration._internal();

  bool _initialized = false;

  late DotEnv _dotEnv;
  late Variables _variables;

  FutureOr<void> initialize() async {
    _dotEnv = DotEnv();
    try {
      await _dotEnv.load();
      _variables = Variables(dotEnv: _dotEnv);
    } catch (error) {
      AppLogger.instance.error(
        title: runtimeType.toString(),
        message: 'Error while accessing .env file. Using fallback values',
      );

      _variables = Variables(useFallbackValues: true, dotEnv: _dotEnv);
    } finally {
      _initialized = true;
    }
  }

  Variables get variables {
    if (!_initialized) {
      throw Exception('EnvironmentConfiguration has not been initialized');
    }

    return _variables;
  }
}

class Variables {
  final DotEnv _dotEnv;
  final bool useFallbackValues;

  static const _connectTimeoutValue = 6000;
  static const _receiveTimeoutValue = 6000;
  static const _sendTimeoutValue = 6000;
  static const _retryTimeIntervalValue = 5;
  static const _syncDownRetryCountValue = 3;

  static const _envName = EnvEntry(
    'ENV_NAME',
    'DEV',
  );

  static const _connectTimeout = EnvEntry(
    'CONNECT_TIMEOUT',
    '$_connectTimeoutValue',
  );

  static const _receiveTimeout = EnvEntry(
    'RECEIVE_TIMEOUT',
    '$_connectTimeoutValue',
  );

  static const _dumpErrorApi = EnvEntry(
    'DUMP_ERROR_PATH',
    'error-handler/handle-error',
  );

  static const _syncDownRetryCount = EnvEntry(
    'SYNC_DOWN_RETRY_COUNT',
    '$_syncDownRetryCountValue',
  );

  static const _retryTimeInterval = EnvEntry(
    'RETRY_TIME_INTERVAL',
    '$_retryTimeIntervalValue',
  );
  static const _sendTimeout = EnvEntry(
    'SEND_TIMEOUT',
    '$_connectTimeoutValue',
  );

  static const _baseUrl = EnvEntry(
    'BASE_URL',
    'https://health-dev.digit.org/',
  );

  //this is the endpoint for service registry, rest are hard-coded
  static const _mdmsApi = EnvEntry(
    'MDMS_API_PATH',
    'egov-mdms-service/v1/_search',
  );

  static const _tenantId = EnvEntry(
    'TENANT_ID',
    'default',
  );

  //In order to search for role-actions, use this endpoint
  static const _actionMapUrl = EnvEntry(
    'ACTIONS_API_PATH',
    'access/v1/actions/mdms/_get',
  );

  const Variables({
    this.useFallbackValues = false,
    required DotEnv dotEnv,
  }) : _dotEnv = dotEnv;

  String get baseUrl => useFallbackValues
      ? _baseUrl.value
      : _dotEnv.get(_baseUrl.key, fallback: _baseUrl.value);

  String get mdmsApiPath => useFallbackValues
      ? _mdmsApi.value
      : _dotEnv.get(_mdmsApi.key, fallback: _mdmsApi.value);

  String get completeMdmsApiUrl =>
      '${baseUrl}${mdmsApiPath}'; // Concatenate base URL with API path

  String get actionMapApiPath => useFallbackValues
      ? _actionMapUrl.value
      : _dotEnv.get(_actionMapUrl.key, fallback: _actionMapUrl.value);

  String get tenantId => useFallbackValues
      ? _tenantId.value
      : _dotEnv.get(_tenantId.key, fallback: _tenantId.value);

  String get dumpErrorApiPath => useFallbackValues
      ? _dumpErrorApi.value
      : _dotEnv.get(_dumpErrorApi.key, fallback: _dumpErrorApi.value);

  int get connectTimeout => useFallbackValues
      ? int.tryParse(_connectTimeout.value) ?? _connectTimeoutValue
      : int.tryParse(_dotEnv.get(
            _connectTimeout.key,
            fallback: _connectTimeout.value,
          )) ??
          _connectTimeoutValue;

  int get receiveTimeout => useFallbackValues
      ? int.tryParse(_receiveTimeout.value) ?? _receiveTimeoutValue
      : int.tryParse(_dotEnv.get(
            _receiveTimeout.key,
            fallback: _receiveTimeout.value,
          )) ??
          _receiveTimeoutValue;

  int get sendTimeout => useFallbackValues
      ? int.tryParse(_sendTimeout.value) ?? _sendTimeoutValue
      : int.tryParse(_dotEnv.get(
            _sendTimeout.key,
            fallback: _sendTimeout.value,
          )) ??
          _sendTimeoutValue;

  int get syncDownRetryCount => useFallbackValues
      ? int.tryParse(_syncDownRetryCount.value) ?? _syncDownRetryCountValue
      : int.tryParse(_dotEnv.get(
            _syncDownRetryCount.key,
            fallback: _syncDownRetryCount.value,
          )) ??
          _syncDownRetryCountValue;

  int get retryTimeInterval => useFallbackValues
      ? int.tryParse(_retryTimeInterval.value) ?? _retryTimeIntervalValue
      : int.tryParse(_dotEnv.get(
            _retryTimeInterval.key,
            fallback: _retryTimeInterval.value,
          )) ??
          _retryTimeIntervalValue;

  EnvType get envType {
    final envName = useFallbackValues
        ? _envName.value
        : _dotEnv.get(_envName.key, fallback: _envName.value);

    return EnvType.values.firstWhereOrNull((env) => env.name == envName) ??
        EnvType.dev;
  }
}

class EnvEntry {
  final String key;
  final String value;

  const EnvEntry(this.key, this.value);
}

enum EnvType {
  dev("DEV"),
  uat("UAT"),
  qa("QA"),
  prod("PROD");

  final String env;

  const EnvType(this.env);

  String get name => env;
}
