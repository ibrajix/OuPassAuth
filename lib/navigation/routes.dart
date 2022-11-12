import 'package:flutter/material.dart';
import 'package:our_pass_auth/blocs/app/app_bloc.dart';
import 'package:our_pass_auth/view/screens/home.dart';
import 'package:our_pass_auth/view/screens/login_register.dart';

List<Page>  onGenerateAppViewPages(
    AppStatus state,
    List<Page<dynamic>> pages,
){
  switch(state){
    case AppStatus.authenticated:
      return [Home.page()];
    case AppStatus.unauthenticated:
      return [LoginRegister.page()];
  }
}