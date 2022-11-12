import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/constants/constant.dart';
import 'package:our_pass_auth/cubits/login/login_cubit.dart';

import 'auth_input.dart';

class AuthForm extends StatelessWidget {

  final String fromAuth;

  const AuthForm({Key? key, required this.fromAuth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state.status == LoginStatus.error){
          //handle error
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
              Strings.welcomeBack,
            style: TextStyle(
              fontSize: 20
            ),
          ),
          SizedBox(height: 50),
          EmailInput(),
          SizedBox(height: 20),
          PasswordInput(),
          SizedBox(height: 10),
          LoginButton()
        ],
      ),
    );
  }

}
