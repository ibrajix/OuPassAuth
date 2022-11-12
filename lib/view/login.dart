import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  const Login({Key? key}) : super(key: key);
  static Page page() => const MaterialPage(child: Login());

  static Route route() {
    return MaterialPageRoute(builder: (_) => const Login());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}

