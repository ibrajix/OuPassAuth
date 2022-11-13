import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:our_pass_auth/utils/show_snackbar.dart';
import 'package:our_pass_auth/view/screens/home.dart';

import '../../constants/constant.dart';
import '../../theme/colors.dart';

class VerifyEmail extends StatefulWidget {

  const VerifyEmail({Key? key}) : super(key: key);

  static Page page() => const MaterialPage(child: VerifyEmail());

  static Route route() {
    return MaterialPageRoute(builder: (_) => const VerifyEmail());
  }

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  bool isEmailVerified = false;
  Timer? timer;
  bool canResendEmail = false;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified){
      sendVerificationEmail();
      timer = Timer.periodic(const Duration(seconds: 3), (_) => checkIfEmailIsVerified());
    }
  }

  Future checkIfEmailIsVerified() async {

    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if(isEmailVerified) {
      timer?.cancel();
    }

  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }



  Future sendVerificationEmail() async {
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() {
        canResendEmail = false;
      });

      await Future.delayed(const Duration(seconds: 5));

      setState(() {
        canResendEmail = true;
      });

    }catch(e){
      Utility.showSnackBar(context, e.toString());
    }
  }

  void empty(){

  }

  @override
  Widget build(BuildContext context) => isEmailVerified ? Home()
      : Scaffold(
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
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const Text(
            Strings.verifyEmail,
           style: TextStyle(
             fontWeight: FontWeight.w600,
             fontSize: 20
          ),
        ),
        const SizedBox(height: 20),
        Image.asset(
          Images.email,
          height: 35,
          width: 35,
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Text(
            Strings.verifyEmailMessage,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Text(
            Strings.verifyEmailMessage2,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: canResendEmail ? sendVerificationEmail : empty,
          style: ElevatedButton.styleFrom(
            primary: AppColors.mainColor,
            minimumSize: const Size(250, 45),
          ),
          child: const Text(
            Strings.resendVerification,
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () => FirebaseAuth.instance.signOut(),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(250, 45),
          ),
          child: const Text(
            Strings.cancel,
            style: TextStyle(
                color: AppColors.mainColor
            ),
          ),
        ),
      ],
    ),
  );
}
