import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_pass_auth/blocs/app/app_bloc.dart';
import 'package:our_pass_auth/view/screens/home.dart';
import 'package:our_pass_auth/view/screens/login_register.dart';
import 'package:our_pass_auth/view/screens/verify_email.dart';

List<Page> onGenerateAppViewPages(
    AppStatus state,
    List<Page<dynamic>> pages,
){

  bool emailVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;

  if(state == AppStatus.authenticated && emailVerified){
    return [Home.page()];
  }

  else if(state == AppStatus.authenticated && !emailVerified){
    return [VerifyEmail.page()];
  }
  else {
    return [LoginRegister.page()];
  }

}