import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starterPack/blocs/authbloc.dart';
import 'package:starterPack/blocs/project.dart';
import 'package:starterPack/model/project_types/project_types.dart';
import 'package:starterPack/model/response/responsemodel.dart';

extension ContextUtilityExtensions on BuildContext {
  //get the number of cycles
  List<String> get cycles {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;

    final cycles = projectState.maybeWhen(
        orElse: () => [],
        selected: (projectId, projectType) {
          return projectType.cycles ?? [];
        });

    if (cycles!.isNotEmpty) {
      List<String> resultList = [];

      for (int i = 1; i <= (cycles.length); i++) {
        resultList.add('0${i.toString()}');
      }

      return resultList;
    } else {
      return [];
    }
  }

  ProjectType? get selectedProjectType {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;
    final projectType = projectState.maybeWhen(
      orElse: () => null,
      selected: (projectId, projectType) {
        return projectType;
      },
    );

    return projectType;
  }

  T _get<T extends BlocBase>() {
    try {
      final bloc = read<T>();

      return bloc;
    } on ProviderNotFoundException catch (_) {
      throw AppException(
        '${T.runtimeType} not found in the current context',
      );
    } catch (error) {
      throw AppException('Could not fetch ${T.runtimeType}');
    }
  }
}

class AppException implements Exception {
  AppException([String? message]);
}
