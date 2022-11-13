import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/core/storage/local_preference.dart';
import 'package:our_pass_auth/core/storage/storage_service.dart';
import 'package:our_pass_auth/cubits/login/login_cubit.dart';
import 'package:our_pass_auth/repository/auth_repository.dart';
import 'package:our_pass_auth/utils/error_handler.dart';
import 'package:our_pass_auth/utils/show_snackbar.dart';
import 'package:our_pass_auth/view/widgets/auth_form.dart';
import 'package:our_pass_auth/view/widgets/show_biometrics.dart';


class Login extends StatefulWidget {

  const Login({Key? key}) : super(key: key);
  static Page page() => const MaterialPage(child: Login());
  static Route route() {
    return MaterialPageRoute(builder: (_) => const Login());
  }

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {

  final StorageService storageService = StorageService();
  bool? _checkBiometricsEnabled;

  @override
  void initState() {
    super.initState();
    checkBiometricsEnabled();
  }

  void checkBiometricsEnabled() {
    setState(() {
      _checkBiometricsEnabled = LocalPreference.getCanUseBiometrics();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthRepository>()),
          child: Column(
            children:  [
              const SizedBox(height: 50),
              const AuthFormLogin(),
              _checkBiometricsEnabled == true ? ShowBiometrics() : const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }

}
