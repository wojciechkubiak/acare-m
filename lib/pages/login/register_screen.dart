import 'package:anima/blocs/login/login_bloc.dart';
import 'package:anima/widgets/page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      onBack: () => BlocProvider.of<LoginBloc>(context).add(LoginInitialShow()),
      page: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
        Text('test'),
      ],
    );
  }
}
