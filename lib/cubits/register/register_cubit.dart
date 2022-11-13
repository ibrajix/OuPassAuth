import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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
    emit(state.copyWith(status: RegisterStatus.loading));
    try{
      await _authRepository.register(email: state.email, password: state.password);
      emit(state.copyWith(status: RegisterStatus.success));
    }catch (e) {
      //catch errors
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }


}
