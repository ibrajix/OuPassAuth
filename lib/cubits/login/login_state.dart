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

  const LoginState({
    required this.email,
    required this.password,
    required this.status,
    this.errorMessage
  });

  factory LoginState.initial(){
    return const LoginState(
        email: "",
        password: "",
        status: LoginStatus.initial
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? errorMessage
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage];


}
