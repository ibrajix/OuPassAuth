import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_pass_auth/cubits/register/register_cubit.dart';
import 'package:our_pass_auth/view/screens/login.dart';

import '../../constants/constant.dart';
import '../../cubits/login/login_cubit.dart';
import '../../theme/colors.dart';

class TextFormLogin extends StatelessWidget {

  final String label;

  const TextFormLogin({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: label == Strings.password ? true : false,
      keyboardType: TextInputType.text,
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 32.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        label:  Text(label),
        floatingLabelStyle: const TextStyle(color: AppColors.mainColor),
      ),
      onChanged: (value) {
        if(label == Strings.email){
          context.read<LoginCubit>().emailChanged(value);
        }
        else{
          //password field
          context.read<LoginCubit>().passwordChanged(value);
        }
      },
    );
  }
}

class TextFormRegister extends StatelessWidget {

  final String label;

  const TextFormRegister({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: label == Strings.password ? true : false,
      keyboardType: TextInputType.text,
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 32.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        label:  Text(label),
        floatingLabelStyle: const TextStyle(color: AppColors.mainColor),
      ),
      onChanged: (value) {
        if(label == Strings.email){
          context.read<RegisterCubit>().emailChanged(value);
        }
        else{
          //password field
          context.read<RegisterCubit>().passwordChanged(value);
        }
      },
    );
  }
}

