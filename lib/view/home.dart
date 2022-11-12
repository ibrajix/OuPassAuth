import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constant.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);
  static Page page() => const MaterialPage(child: Home());

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
        margin: const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 20),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
               margin: const EdgeInsets.only(top: 30),
               child: Image.asset(
                 Images.appLogo,
               )
             )
          ],
        ),
      ),
    );
  }
}

