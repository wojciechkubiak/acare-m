import 'package:anima/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './blocs/home/home_bloc.dart';
import './services/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return _repositoryProvider();
  }

  Widget _repositoryProvider() {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeService>(
          create: (context) {
            return HomeService();
          },
        ),
      ],
      child: _multiBlocProvider(),
    );
  }

  Widget _multiBlocProvider() {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeBloc>(
        create: (context) {
          final homeService = RepositoryProvider.of<HomeService>(context);
          return HomeBloc(homeService)..add(HomeLoadSplash());
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomePage) return Home();
        if (state is HomeSplash) return SplashScreen();
        return Loading();
      },
    );
  }
}
