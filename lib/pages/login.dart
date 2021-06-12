import 'package:anima/blocs/login/login_bloc.dart';
import 'package:anima/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './../widgets//widgets.dart';
import './loading.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      // if (state is Logged) authBloc.add(AuthLoggedIn());
    }, builder: (context, state) {
      if (state is LoginInitial)
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              Column(
                children: [
                  Input(
                    label: 'Email',
                    textEditingController: email,
                  ),
                  Input(
                    isPassword: true,
                    label: 'Hasło',
                    textEditingController: password,
                  ),
                  TextButton(
                    style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomColor.mainAccent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        'Zaloguj',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Text(
                      'Stwórz konto',
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: Colors.black54),
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        );
      return Loading();
    });
  }
}
