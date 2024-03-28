import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/model/individual/individual.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/login/loginModel.dart';
import 'package:new_digit_app/model/response/responsemodel.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';
import 'package:new_digit_app/repositories/individualSearchRepo.dart';
import 'package:new_digit_app/repositories/authRepo.dart';

part 'authbloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late String _accesstoken;
  late UserRequest _userRequest;
  late String _refreshtoken;
  final authRepository = AuthRepository();

  AuthBloc() : super(const AuthState.unauthenticated()) {
    on<_AuthLoginEvent>(_onLogin);
    on<_AuthLogoutEvent>(_onLogout);
    on<AuthLoadEvent>(_onLoad);
  }

  FutureOr<void> _onLogin(
      _AuthLoginEvent event, Emitter<AuthState> emit) async {
    ResponseModel response;
    final secureStore = SecureStore();
    //Send a login request and retrieve the access_token for further requests
    try {
      final loginUrl =
          event.actionMap?[DataModelType.user]?[ApiOperation.login];

      response = await authRepository.validateLogin(
          loginUrl!,
          LoginModel(
            username: event.username,
            password: event.password,
            tenantId: envConfig.variables.tenantId,
            grant_type: 'password',
            userType: 'EMPLOYEE',
          ));

      _accesstoken = response.access_token;
      _refreshtoken = response.refresh_token!;
      _userRequest = response.userRequest!;

      //store accessToken in secure storage
      secureStore.setAccessToken(_accesstoken);

      //store other access Information in secure storage
      secureStore.setAccessInfo(ResponseModel(
          access_token: _accesstoken,
          token_type: response.token_type,
          refresh_token: _refreshtoken,
          scope: response.scope,
          userRequest: _userRequest));

      //change to authenticated state now that we have access
      emit(AuthState.authenticated(
          accesstoken: _accesstoken,
          refreshtoken: _refreshtoken,
          userRequest: _userRequest));

      final actionsWrapper = await authRepository.searchRoleActions({
        "roleCodes": response.userRequest?.roles.map((e) => e.code).toList(),
        "tenantId": envConfig.variables.tenantId,
        "actionMaster": "actions-test",
        "enabled": true,
      });

      //role actions must also be stored in secureStore so that we don't have to make calls for it repeatedly
      await secureStore.setRoleActions(actionsWrapper);

      final individualRemoteRepository = IndividualSearchRemoteRepository();

      final loggedInIndividual =
          await individualRemoteRepository.searchIndividual(
              IndividualSearchModel(
                userUuid: [response.userRequest!.uuid],
              ),
              event.actionMap);

      secureStore.setSelectedIndividual(loggedInIndividual.first.id);
    } catch (err) {
      rethrow;
    }
  }

  FutureOr<void> _onLogout(_AuthLogoutEvent event, Emitter<AuthState> emit) {
    //when we logout, we need the access token to be deleted and invalidated. All the AccessInfo stored locally is now redundant. Delete it.
    final secureStore = SecureStore();
    secureStore.deleteAccessToken();
    secureStore.deleteAccessInfo();
    secureStore.deleteSelectedIndividual();

    emit(const AuthState.unauthenticated());
  }

  Future<FutureOr<void>> _onLoad(
      AuthLoadEvent event, Emitter<AuthState> emit) async {
    final secureStore = SecureStore();

    //first attempt to get the accessToken from local secure storage, if successful, the user need not go through the login page again
    ResponseModel? accessInfo;
    accessInfo = await secureStore.getAccessInfo();

    if (accessInfo != null) {
      _accesstoken = accessInfo.access_token;
      _refreshtoken = accessInfo.refresh_token!;
      _userRequest = accessInfo.userRequest!;

      emit(AuthState.authenticated(
          accesstoken: _accesstoken,
          refreshtoken: _refreshtoken,
          userRequest: _userRequest));
    } else {
      //stay in the unauthenicated state
      emit(const AuthState.unauthenticated());
    }
  }
}

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(
          {String? username,
          String? password,
          Map<DataModelType, Map<ApiOperation, String>>? actionMap}) =
      _AuthLoginEvent;
  const factory AuthEvent.logout() = _AuthLogoutEvent;
  const factory AuthEvent.attemptLoad() = AuthLoadEvent;
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.error() = _ErrorState;
  const factory AuthState.unauthenticated() = _UnauthenticatedState;
  const factory AuthState.authenticated({
    required String accesstoken,
    required String? refreshtoken,
    required UserRequest? userRequest,
  }) = _AuthenticatedState;
}
