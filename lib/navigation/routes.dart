import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:our_pass_auth/constants/constant.dart';
import '../view/login.dart';
import '../view/login_register.dart';
import '../view/register.dart';
import '../view/home.dart';

class Routes {
  final router = GoRouter(
    routes:[

      GoRoute(
          path: Destination.loginRegisterPath,
          builder: (context, state) => const LoginRegister()
      ),

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