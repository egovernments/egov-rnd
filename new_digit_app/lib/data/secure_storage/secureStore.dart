import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:new_digit_app/model/appconfig/mdmsResponse.dart';
import 'package:new_digit_app/model/response/responsemodel.dart';
import 'package:new_digit_app/model/role_actions/role_actions_model.dart';
import 'package:new_digit_app/model/serviceRegistry/serviceRegistryModel.dart';

import '../../model/localization/localizationModel.dart';

class SecureStore {
  final storage = const FlutterSecureStorage();
  SecureStore();

  Future setLocalizations(
      LocalizationModel localizationList, String locale) async {
    String jsonLocalizationList = json.encode(localizationList.toJson());
    await storage.write(key: locale, value: jsonLocalizationList);
  }

  Future<String?> getLocalizations(String locale) async {
    return await storage.read(key: locale);
  }

  //App configs
  Future setAppConfig(MdmsResponseModel mdmsResponseModel) async {
    String jsonMdmsResponse = json.encode(mdmsResponseModel.toJson());
    await storage.write(key: 'appConfig', value: jsonMdmsResponse);
  }

  Future<String?> getAppConfig() async {
    return await storage.read(key: 'appConfig');
  }

  //service Registry
  Future setServiceRegistry(ServiceRegistryModel serviceRegistryModel) async {
    String jsonServiceRegistryList = json.encode(serviceRegistryModel.toJson());
    await storage.write(key: 'serviceRegistry', value: jsonServiceRegistryList);
  }

  Future<String?> getServiceRegistry() async {
    return await storage.read(key: 'serviceRegistry');
  }

  //access token
  Future setAccessToken(String? accessToken) async {
    await storage.write(key: 'accessToken', value: accessToken);
  }

  Future<String?> getAccessToken() async {
    return await storage.read(key: 'accessToken');
  }

  Future deleteAccessToken() async {
    await storage.delete(key: 'accessToken');
  }

  //other auth information
  Future setAccessInfo(ResponseModel accessInfo) async {
    String jsonAccessInfo = json.encode(accessInfo.toJson());
    await storage.write(key: 'accessInfo', value: jsonAccessInfo);
  }

  Future<ResponseModel?> getAccessInfo() async {
    String? jsonAccessInfo = await storage.read(key: 'accessInfo');
    if (jsonAccessInfo == null) return null;
    try {
      return ResponseModel.fromJson(json.decode(jsonAccessInfo));
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  Future deleteAccessInfo() async {
    await storage.delete(key: 'accessInfo');
  }

  //role actions
  Future setRoleActions(RoleActionsWrapperModel actionsWrapper) async {
    String jsonActionsWrapper = json.encode(actionsWrapper.toJson());
    await storage.write(key: 'actionsWrapper', value: jsonActionsWrapper);
  }

  Future<RoleActionsWrapperModel?> getRoleActions() async {
    String? jsonActionsWrapper = await storage.read(key: 'actionsWrapper');

    if (jsonActionsWrapper == null) return null;

    try {
      return RoleActionsWrapperModel.fromJson(json.decode(jsonActionsWrapper));
    } catch (err) {
      print(err);
      rethrow;
    }
  }

  //Individual ID
  Future setSelectedIndividual(String? id) async {
    await storage.write(key: 'individualId', value: id);
  }

  Future<String?> getSelectedIndividual() async {
    final result = await storage.read(key: 'individualId');
    return result;
  }

  Future deleteSelectedIndividual() async {
    await storage.delete(key: 'individualId');
  }
}
