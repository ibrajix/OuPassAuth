import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/core/start.dart';
import 'package:our_pass_auth/repository/auth_repository.dart';
import 'package:our_pass_auth/view/screens/login_register.dart';

import '../blocs/app/app_bloc.dart';
import '../navigation/routes.dart';

class OurPassAuthApp extends StatelessWidget {

  final AuthRepository _authRepository;

  const OurPassAuthApp({
    Key? key,
    required AuthRepository authRepository
  })
      : _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(authRepository: _authRepository),
        child: const Start()
      ),
    );
  }

}