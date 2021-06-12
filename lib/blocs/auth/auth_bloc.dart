import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import './../../services/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(AuthService authService)
      : _authService = authService,
        super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLoadSplashScreen) yield* _mapAppSplashScreen(event);
  }

  Stream<AuthState> _mapAppSplashScreen(event) async* {
    yield AuthSplashScreen();

    try {
      await Future.delayed(Duration(seconds: 5));
      if (await _authService.getCurrent()) {
        yield AuthSuccess();
      } else {
        yield AuthInitForm();
      }
    } catch (e) {}
  }
}
