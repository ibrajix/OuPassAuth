abstract class Images {
  static const appLogo = 'assets/images/our_pass_logo.png';
  static const fingerprint = 'assets/images/fingerprint.png';
  static const email = 'assets/images/email.png';
}

abstract class  Strings {

  //generic strings
  static const error404 = "404 Error!";
  static const appName = "OurPass";
  static const welcomeToOurPass = "Welcome to OurPass";
  static const login = "Login";
  static const register = "Register";
  static const email = "Email";
  static const password = "Password";
  static const welcomeBack = "Welcome Back!";
  static const welcomeBoss = "Welcome Boss!";
  static const logout = "Logout!";
  static const isFirstTimeFalse = "false";
  static const isFirstTimeTrue = "true";
  static const completeAuth = "Authenticate to continue";
  static const useBiometrics = "Use Biometrics";
  static const useBiometricsQ = "Use Biometrics?";
  static const getStarted = "Get Started";
  static const verifyEmail = "Verify Email";
  static const verifyEmailMessage = "A verification email has been sent to your email.! (Check your spam folder)";
  static const verifyEmailMessage2 = "Once verified, come back to the app and automatically login!";
  static const resendVerification = "Resend Verification!";
  static const cancel = "Cancel";


  //error messages
  static const biometricsFailed = "For some weird reason this isn't working yet. Firebase does not support biometric signup, so I am trying to use a hack. Will fix";
  static const genericErrorMessage = "Something went wrong, try again";
}