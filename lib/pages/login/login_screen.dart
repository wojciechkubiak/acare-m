import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/login/login_bloc.dart';
import '../../config/colors.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                inputType: InputType.EMAIL,
              ),
              Input(
                isPassword: true,
                label: 'Hasło',
                textEditingController: password,
                inputType: InputType.PASSWORD,
              ),
              TextButton(
                style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
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
                onPressed: () => print('${email.text} ${password.text}'),
              ),
              TextButton(
                child: Text(
                  'Stwórz konto',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.black54),
                ),
                onPressed: () => BlocProvider.of<LoginBloc>(context)
                    .add(LoginRegisterShow()),
              ),
            ],
          )
        ],
      ),
    );
  }
}
