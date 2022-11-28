import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/constants/constant.dart';
import 'package:our_pass_auth/cubits/login/login_cubit.dart';
import 'package:our_pass_auth/cubits/register/register_cubit.dart';
import 'package:our_pass_auth/utils/show_snackbar.dart';

import 'auth_input.dart';

class AuthFormRegister extends StatelessWidget {

  const AuthFormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if(state.status == RegisterStatus.success){
          Navigator.of(context).pop();
        }
        else if(state.status == RegisterStatus.error){
          //show error message
          Utility.showSnackBar(context, state.errorMessage ?? Strings.genericErrorMessage);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const Text(
              Strings.getStarted,
            style: TextStyle(
              fontSize: 20
            ),
          ),
          const SizedBox(height: 50),
          const EmailInputRegister(),
          const SizedBox(height: 20),
          const PasswordInputRegister(),
          const SizedBox(height: 10),
          RegisterButton()
        ],
      ),
    );
  }

}


class AuthFormLogin extends StatelessWidget {

  const AuthFormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state.status == LoginStatus.success){
          Navigator.of(context).pop();
        }
        else if(state.status == LoginStatus.error){
          //show error here
          Utility.showSnackBar(context, state.errorMessage ?? Strings.genericErrorMessage);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  const [
          Text(
            Strings.welcomeBack,
            style: TextStyle(
                fontSize: 20
            ),
          ),
          SizedBox(height: 50),
          EmailInputLogin(),
          SizedBox(height: 20),
          PasswordInputLogin(),
          SizedBox(height: 10),
          LoginButton()
        ],
      ),
    );
  }

}
