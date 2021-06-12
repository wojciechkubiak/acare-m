import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import './../../services/services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService _loginService;

  LoginBloc(LoginService loginService)
      : _loginService = loginService,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInitialShow) yield* _mapAppShowLoginToState(event);
  }

  Stream<LoginState> _mapAppShowLoginToState(event) async* {
    yield LoginInitial();
  }
}
