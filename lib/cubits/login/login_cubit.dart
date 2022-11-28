import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import '../../repository/auth_repository.dart';
import '../../utils/error_handler.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future loginWithCredentials() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try{
      await _authRepository.loginWithCredentials(email: state.email, password: state.password);
      emit(state.copyWith(status: LoginStatus.success));
    } on FirebaseAuthException catch  (e){
      //catch errors
      emit(state.copyWith(
          status: LoginStatus.error,
          errorMessage: e.toString()
        )
      );
    }
  }

  Future loginWithCredentialsBio(String? email, String? password) async {

    if(state.status == LoginStatus.loading) return;
    emit(state.copyWith(status: LoginStatus.loading));
    try{
      await _authRepository.loginWithCredentials(email: email?? "", password: password?? "");
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e){
      //catch errors
      emit(state.copyWith(
         status: LoginStatus.error,
         errorMessage: e.toString()
       )
      );
    }
  }

}
