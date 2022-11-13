import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/constants/constant.dart';
import 'package:our_pass_auth/cubits/login/login_cubit.dart';
import 'package:our_pass_auth/cubits/register/register_cubit.dart';
import 'package:our_pass_auth/view/screens/home.dart';
import 'package:our_pass_auth/view/screens/login.dart';
import 'package:our_pass_auth/view/widgets/text_form_field.dart';

import '../../core/storage/storage_service.dart';
import '../../theme/colors.dart';

class EmailInputLogin extends StatelessWidget {

  const EmailInputLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return const TextFormLogin(label: Strings.email);
      },
    );
  }
}

class EmailInputRegister extends StatelessWidget {

  const EmailInputRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return const TextFormRegister(label: Strings.email);
      },
    );
  }
}


class PasswordInputLogin extends StatelessWidget {
  const PasswordInputLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return const TextFormLogin(label: Strings.password);
      });
  }
}


class PasswordInputRegister extends StatelessWidget {
  const PasswordInputRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return const TextFormRegister(label: Strings.password);
        });
  }
}

class LoginButton extends StatelessWidget {

  LoginButton({Key? key}) : super(key: key);

  final StorageService _secureStorage = StorageService();

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.loading ?
            const CircularProgressIndicator() :
        ElevatedButton(
            onPressed: () async{
              context.read<LoginCubit>().loginWithCredentials();
              /*if(state.status == LoginStatus.success){
                await _secureStorage.setEmail(state.email);
                await _secureStorage.setPassword(state.password);
                await _secureStorage.setIsFirstTimeLogin(Strings.isFirstTimeFalse);
                if (!mounted) return;
                Navigator.of(context).push(Home.route());
              }*/
            },
            style: ElevatedButton.styleFrom(
              primary: AppColors.mainColor,
              minimumSize: const Size(250, 45),
            ),
            child: const Text(
              Strings.login
            ));
      },
    );
  }

}


class RegisterButton extends StatelessWidget {

  RegisterButton({Key? key}) : super(key: key);

  final StorageService _secureStorage = StorageService();

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == RegisterStatus.loading ?
        const CircularProgressIndicator() :
        ElevatedButton(
            onPressed: () async{
              context.read<RegisterCubit>().registerWithCredentials();
              await _secureStorage.setEmail(state.email);
            },
            style: ElevatedButton.styleFrom(
              primary: AppColors.mainColor,
              minimumSize: const Size(250, 45),
            ),
            child: const Text(
                Strings.register
            ));
      },
    );
  }

}






