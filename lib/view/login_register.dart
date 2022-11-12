import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_pass_auth/theme/colors.dart';
import 'package:our_pass_auth/view/home.dart';
import 'package:our_pass_auth/view/login.dart';

import '../constants/constant.dart';

class LoginRegister extends StatelessWidget {

  const LoginRegister({Key? key}) : super(key: key);
  static Page page() => const MaterialPage(child: LoginRegister());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 150, left: 30, right: 30, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Images.appLogo,
                  height: 35,
                  width: 35,
                ),
                const Text(
                  Strings.appName,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              Strings.welcomeToOurPass,
              style: TextStyle(
                  fontSize: 22
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(Login.route());
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.mainColor,
                minimumSize: const Size(250, 45),
              ),
              child: const Text(Strings.login),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(Login.route());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 45),
              ),
              child: const Text(
                  Strings.register,
                style: TextStyle(
                  color: AppColors.mainColor
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}


