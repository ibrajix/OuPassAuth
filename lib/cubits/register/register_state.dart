part of 'register_cubit.dart';



enum RegisterStatus { initial, loading, success, error }

class RegisterState extends Equatable {

  final String email;
  final String password;
  final RegisterStatus status;

  const RegisterState({
    required this.email,
    required this.password,
    required this.status
 });

  factory RegisterState.initial(){
    return const RegisterState(
        email: "", password: "", status: RegisterStatus.initial
    );
  }

  @override
  List<Object?> get props => [email, password, status];

  RegisterState copyWith({
    String? email,
    String? password,
    RegisterStatus? status,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

}
