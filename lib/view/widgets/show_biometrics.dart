import 'package:flutter/material.dart';
import 'package:our_pass_auth/core/biometrics/authentication.dart';

import '../../constants/constant.dart';

class ShowBioMetrics extends StatefulWidget {
  const ShowBioMetrics({Key? key}) : super(key: key);

  @override
  State<ShowBioMetrics> createState() => _ShowBioMetricsState();
}

class _ShowBioMetricsState extends State<ShowBioMetrics> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool isAuthenticated = await Authentication.authenticateWithBiometrics();
        if(isAuthenticated){
          //pass the saved email to firebase and log user in
        }
      },
      child: Image.asset(
         Images.appLogo,
      ),
    );
  }
}
