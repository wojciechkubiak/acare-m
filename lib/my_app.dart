import 'package:anima/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/auth_bloc.dart';

import 'services/services.dart';

import './../pages/loading.dart';
import './../pages/error.dart';
import './../pages/splash_screen.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return _repositoryProvider();
  }

  Widget _repositoryProvider() {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
          create: (context) {
            return AuthService();
          },
        ),
      ],
      child: _multiBlocProvider(),
    );
  }

  Widget _multiBlocProvider() {
    return MultiBlocProvider(providers: [
      BlocProvider<AuthBloc>(
        create: (context) {
          final authService = RepositoryProvider.of<AuthService>(context);
          return AuthBloc(authService)..add(AuthLoadSplashScreen());
        },
      ),
    ], child: _main());
  }

  Widget _main() {
    ThemeData _theme = ThemeData(
      primaryColor: Colors.red,
      accentColor: Colors.red,
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
    );

    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: _theme,
      home: Scaffold(
        body: Theme(
          data: _theme,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light.copyWith(
                systemNavigationBarColor: Colors.white,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarIconBrightness: Brightness.dark,
                systemNavigationBarDividerColor: Colors.white,
                statusBarColor: Colors.white,
              ),
              child: _blocBuilder()),
        ),
      ),
    );
  }

  Widget _blocBuilder() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) return Text('Home');
        if (state is AuthInitForm) return Text('Register');
        if (state is AuthSplashScreen) return SplashScreen();
        if (state is AuthError) return Error();
        return Loading();
      },
    );
  }
}
