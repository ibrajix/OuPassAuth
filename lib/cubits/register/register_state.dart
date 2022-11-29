part of 'register_cubit.dart';



enum RegisterStatus { initial, loading, success, error }

class RegisterState extends Equatable {

  final String email;
  final String password;
  final RegisterStatus status;
  final String? errorMessage;
  final bool? loggedInWithBiometrics;

  const RegisterState({
    required this.email,
    required this.password,
    required this.status,
    this.errorMessage,
    this.loggedInWithBiometrics
 });

  factory RegisterState.initial(){
    return const RegisterState(
        email: "", password: "", status: RegisterStatus.initial, loggedInWithBiometrics: false
    );
  }


  RegisterState copyWith({
    String? email,
    String? password,
    RegisterStatus? status,
    String? errorMessage,
    bool? loggedInWithBiometrics
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      loggedInWithBiometrics: loggedInWithBiometrics ?? this.loggedInWithBiometrics
    );
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage, loggedInWithBiometrics];

}
