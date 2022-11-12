import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/constants/constant.dart';
import 'package:our_pass_auth/cubits/login/login_cubit.dart';
import 'package:our_pass_auth/view/screens/login.dart';
import 'package:our_pass_auth/view/widgets/text_form_field.dart';

import '../../core/storage/storage_service.dart';
import '../../theme/colors.dart';

class EmailInput extends StatelessWidget {

  final String fromAuth;

  const EmailInput({Key? key, required this.fromAuth}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return const TextForm(label: Strings.email);
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return const TextForm(label: Strings.password);
      });
  }
}

class LoginButton extends StatelessWidget {
  LoginButton({Key? key}) : super(key: key);

  final StorageService _secureStorage = StorageService();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {

        return state.status == LoginStatus.loading ?
            const CircularProgressIndicator() :
        ElevatedButton(
            onPressed: () async{
              context.read<LoginCubit>().loginWithCredentials();
              if(state.status == LoginStatus.success){
                await _secureStorage.setEmail(state.email);
                await _secureStorage.setPassword(state.password);
                await _secureStorage.setIsFirstTimeLogin(Strings.isFirstTimeFalse);
              }
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



