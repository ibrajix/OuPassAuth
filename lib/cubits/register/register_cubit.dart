import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:our_pass_auth/view/screens/register.dart';

import '../../repository/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {

  final AuthRepository _authRepository;
  RegisterCubit(this._authRepository) : super(RegisterState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: RegisterStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: RegisterStatus.initial));
  }

  Future registerWithCredentials() async {
    if(state.status == RegisterStatus.loading) return;
    emit(state.copyWith(status: RegisterStatus.loading));
    try{
      await _authRepository.register(email: state.email, password: state.password);
      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e){
      //catch errors

    }
  }


}
