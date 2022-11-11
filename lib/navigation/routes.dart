import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:our_pass_auth/constants/constant.dart';
import 'package:our_pass_auth/screens/home.dart';
import 'package:our_pass_auth/screens/login.dart';

import '../screens/register.dart';

abstract class Routes {
  final router = GoRouter(
    routes:[
      GoRoute(
          path: Destination.homePath,
          builder: (context, state) => const Home()
      ),
      GoRoute(
          path: Destination.registerPath,
          builder: (context, state) => const Register()
      ),
      GoRoute(
          path: Destination.loginPath,
          builder: (context, state) => const Login()
      )
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text(Strings.error404),
      ),
    )
  );
}