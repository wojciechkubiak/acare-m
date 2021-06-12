import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import './../../services/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(AuthService authService) : _authService = authService,
  super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async * {
    if(event is AuthLoadSplashScreen)
        yield* _mapAppSplashScreen(event);
  if(event is AuthLoadForm)
        yield* _mapAppLoadedToState(event);
    }
  

  Stream<AuthState> _mapAppLoadedToState(event) async* {
    yield AuthLoading();

    try {
      final currentUser = await _authService.getCurrent();
      if(currentUser) {
        yield AuthSuccess();
      } else {
        yield AuthInitForm();
      }
    } catch (e) {

    }
  }

  Stream<AuthState> _mapAppSplashScreen(event) async* {
    yield AuthSplashScreen();
  }
}