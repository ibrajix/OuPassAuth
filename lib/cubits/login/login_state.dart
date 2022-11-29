part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error
}


class LoginState extends Equatable {

  final String email;
  final String password;
  final LoginStatus status;
  final String? errorMessage;
  final String? savedSecureEmail;
  final String? savedSecurePassword;
  final bool? loggedInWithBiometrics;

   const LoginState({
    required this.email,
    required this.password,
    required this.status,
    this.errorMessage,
    this.savedSecureEmail,
    this.savedSecurePassword,
    this.loggedInWithBiometrics
  });

  factory LoginState.initial(){
    return const LoginState(
        email: "",
        password: "",
        status: LoginStatus.initial,
        loggedInWithBiometrics: false
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? errorMessage,
    String? savedSecureEmail,
    String? savedSecurePassword,
    bool? loggedInWithBiometrics
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      savedSecureEmail: savedSecureEmail ?? this.savedSecureEmail,
      savedSecurePassword: savedSecurePassword ?? this.savedSecurePassword,
      loggedInWithBiometrics: loggedInWithBiometrics ?? this.loggedInWithBiometrics
    );
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage, savedSecureEmail, savedSecurePassword, loggedInWithBiometrics];


}
