import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/repository/AuthRepository.dart';

import '../blocs/app/app_bloc.dart';
import '../navigation/routes.dart';

class OurPassAuthApp extends StatelessWidget {

  final AuthRepository _authRepository;

  OurPassAuthApp({
    Key? key,
    required AuthRepository authRepository
  })
      : _authRepository = authRepository,
        super(key: key);

  final _router = Routes().router;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(authRepository: _authRepository),
        child: MaterialApp.router(
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            routeInformationProvider: _router.routeInformationProvider
        ),
      ),
    );
  }

}