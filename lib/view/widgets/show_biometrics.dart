import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:our_pass_auth/core/biometrics/authentication.dart';
import 'package:our_pass_auth/cubits/login/login_cubit.dart';
import 'package:our_pass_auth/utils/show_snackbar.dart';
import 'package:our_pass_auth/view/screens/home.dart';

import '../../constants/constant.dart';
import '../../core/storage/storage_service.dart';


class ShowBiometrics extends StatefulWidget {

  ShowBiometrics({Key? key}) : super(key: key);
  @override
  State<ShowBiometrics> createState() => _ShowBiometricsState();

}

class _ShowBiometricsState extends State<ShowBiometrics> {

  final StorageService storageService = StorageService();
  String? _savedSecureEmail = "";
  String? _savedSecurePassword = "";

  @override
  void initState() {
    super.initState();
    fetchSecuredStorageData();
  }

  Future<void> fetchSecuredStorageData() async {
    _savedSecureEmail = await storageService.getEmail();
    _savedSecurePassword = await storageService.getPassword();
  }

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                bool isAuthenticated = await Authentication.authenticateWithBiometrics();
                if (isAuthenticated) {
                  //pass the saved email and password to firebase and log user in
                  //for some weird reason, this is returning an empty string 🤔
                  //ideally, the saved email and password in secure storage is to be used to login the user with firebase
                  debugPrint('movieTitle: $_savedSecureEmail');
                  /*context.read<LoginCubit>().loginWithCredentialsBio(_savedSecureEmail, _savedSecurePassword);*/
                  //show a snackBar until I fix this
                  if (!mounted) return;
                  Utility.showSnackBar(context, Strings.biometricsFailed);
                }
              },
              child: Image.asset(
                Images.fingerprint,
                height: 50,
                width: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text(Strings.useBiometrics)
          ],
        );
      },
    );
  }
}
