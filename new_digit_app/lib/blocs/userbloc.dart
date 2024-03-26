import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/user/userModel.dart';
import 'package:new_digit_app/repositories/user_repository.dart';

part 'userbloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState.empty()) {
    on(_handleSearchUser);
    on(_handleUpdateUser);
  }

  FutureOr<void> _handleSearchUser(
      UserSearchEvent event, Emitter<UserState> emit) async {
    try {
      //fetch the Api endpoint from the actionMap
      final searchUrl =
          event.actionMap[DataModelType.user]?[ApiOperation.search];

      //make the api call and process the response
      final Response response =
          await UserRepository().searchUser(searchUrl!, event.uuid);
      final responseMap = response.data;
      final Iterable entityResponse = await responseMap["user"];
      Iterable<Map<String, dynamic>> entityList =
          entityResponse.whereType<Map<String, dynamic>>();
      final results =
          entityList.map((e) => UserModelMapper.fromMap(e)).toList();

      //go to the user state while providing the userModel
      //this userModel contains all of the details that are to be displayed on the profile page
      emit(UserState.user(userModel: results.first));
    } catch (err) {
      emit(const UserState.error());
      rethrow;
    }
  }

  FutureOr<void> _handleUpdateUser(
    UserUpdateEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());
    try {
      //fetch endpoint for update from the actionMap
      final updateUrl =
          event.actionMap[DataModelType.user]?[ApiOperation.update];

      //make the request and process the response
      final Response response =
          await UserRepository().updateUser(updateUrl!, event.user);
      final responseMap = response.data;
      final Iterable entityResponse = await responseMap["user"];
      Iterable<Map<String, dynamic>> entityList =
          entityResponse.whereType<Map<String, dynamic>>();

      final results =
          entityList.map((e) => UserModelMapper.fromMap(e)).toList();

      //change the userState, it had an old user data, now it has a new user data in the UserModel parameter
      emit(UserState.user(userModel: results.first));
    } on DioError catch (error) {
      final String errorCode = error.response?.data['Errors'][0]['code'];
      emit(UserState.error(errorCode));

      //if the updation fails, you would ideally want to change back to the old user data and display whatever details were already there
      emit(UserState.user(userModel: event.olduser));

      rethrow;
    }
  }
}

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.searchUser(
          {required String uuid,
          required Map<DataModelType, Map<ApiOperation, String>> actionMap}) =
      UserSearchEvent;
  const factory UserEvent.updateUser(
          {required UserModel user,
          required UserModel olduser,
          required Map<DataModelType, Map<ApiOperation, String>> actionMap}) =
      UserUpdateEvent;
}

@freezed
class UserState with _$UserState {
  const factory UserState.empty() = _UserEmptyState;
  const factory UserState.loading() = _UserLoadingState;
  const factory UserState.user({UserModel? userModel}) = UserUserState;
  const factory UserState.error([String? error]) = _UserErrorState;
}
