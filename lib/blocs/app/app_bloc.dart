import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/user.dart';
import '../../repository/AuthRepository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {

  final AuthRepository _authRepository;
  StreamSubscription<User>? _streamSubscription;

  AppBloc({
    required AuthRepository authRepository
  }) : _authRepository = authRepository,
        super(
        authRepository.currentUser.isNotEmpty
            ? AppState.authenticated(authRepository.currentUser) : const AppState.unauthenticated(),
  ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
  }

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emitter){
    emit(event.user.isNotEmpty ? AppState.authenticated(event.user) : const AppState.unauthenticated());
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emitter){
    unawaited(_authRepository.logout());
  }



}