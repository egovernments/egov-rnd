import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/userbloc.dart';

class AuthenticatedScreenWrapper extends StatelessWidget {
  const AuthenticatedScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        )
      ], child: const AutoRouter());
}
