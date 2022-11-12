import 'package:local_auth/local_auth.dart';

import '../../constants/constant.dart';

class Authentication {

  static Future<bool> authenticateWithBiometrics() async {

    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: Strings.completeAuth,
        options: const AuthenticationOptions(biometricOnly: true),
      );
    }

    return isAuthenticated;
  }
}