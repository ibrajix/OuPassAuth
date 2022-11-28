import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/constants/constant.dart';
import 'package:our_pass_auth/cubits/register/register_cubit.dart';

import '../../cubits/login/login_cubit.dart';
import '../../repository/auth_repository.dart';
import '../widgets/auth_form.dart';

class Register extends StatelessWidget {

  const Register({Key? key}) : super(key: key);
  static Page page() => const MaterialPage(child: Register());

  static Route route() {
    return MaterialPageRoute(builder: (_) => const Register());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          create: (_) => RegisterCubit(context.read<AuthRepository>()),
          child:  AuthFormRegister(),
        ),
      ),
    );
  }

}
