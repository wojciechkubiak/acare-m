import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login/login_bloc.dart';
import './login/login.dart';
import './loading.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      // if (state is Logged) authBloc.add(AuthLoggedIn());
    }, builder: (context, state) {
      if (state is LoginInitial) return LoginScreen();
      if (state is LoginRegister) return RegisterScreen();
      return Loading();
    });
  }
}
