import 'package:peaceful_pet/config/colors.dart';
import 'package:peaceful_pet/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:easy_localization/easy_localization.dart';

import './blocs/home/home_bloc.dart';
import './services/services.dart';
import './widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: MyApp.list,
      path: "assets/langs",
    ),
  );
}

class MyApp extends StatelessWidget {
  static const list = [
    Locale('pl'),
  ];

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

enum CurrentPage { HOME, ARTICLES, ABOUT }

class _MyHomeState extends State<MyHome> {
  ZoomDrawerController zoomController = ZoomDrawerController();
  bool isOpen = false;
  CurrentPage _currentPage = CurrentPage.HOME;

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

  Widget menu(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        height: height,
        width: width,
        color: CustomColor.darkGreenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Header(
              padding: EdgeInsets.only(top: 112),
              showBottomText: true,
              isWhite: true,
            ),
            _menuButtons(),
            Container(),
          ],
        ));
  }

  Widget _menuButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _menuButton(
          text: 'Strona główna',
          page: CurrentPage.HOME,
        ),
        _menuButton(
          text: 'Artykuły',
          page: CurrentPage.ARTICLES,
        ),
        _menuButton(
          text: 'Szczegóły',
          page: CurrentPage.ABOUT,
        ),
      ],
    );
  }

  Widget _menuButton({required String text, required CurrentPage page}) {
    bool isActive = _currentPage == page;

    return Container(
      width: MediaQuery.of(context).size.width - 16,
      margin: EdgeInsets.only(left: 16),
      child: TextButton(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 26,
                color: isActive ? CustomColor.darkGreenAccent : Colors.white,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          onPressed: () {
            zoomController.close!();
            setState(() {
              _currentPage = page;
              isOpen = false;
            });
          },
          style: TextButton.styleFrom(
              primary: !isActive ? Colors.white : CustomColor.darkGreenAccent,
              backgroundColor:
                  isActive ? Colors.white : CustomColor.darkGreenAccent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              textStyle: TextStyle())),
    );
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
            value: !isOpen
                ? SystemUiOverlayStyle.light.copyWith(
                    systemNavigationBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.dark,
                    systemNavigationBarIconBrightness: Brightness.dark,
                    systemNavigationBarDividerColor: Colors.white,
                    statusBarColor: Colors.white,
                  )
                : SystemUiOverlayStyle.light.copyWith(
                    systemNavigationBarColor: CustomColor.darkGreenAccent,
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.light,
                    systemNavigationBarIconBrightness: Brightness.light,
                    systemNavigationBarDividerColor:
                        CustomColor.darkGreenAccent,
                    statusBarColor: CustomColor.darkGreenAccent,
                  ),
            child: _blocBuilder(),
          ),
        ),
      ),
    );
  }

  Widget _blocBuilder() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomePage)
          return ZoomDrawer(
            controller: zoomController,
            disableGesture: isOpen,
            style: DrawerStyle.Style5,
            menuScreen: menu(context),
            mainScreen: GestureDetector(
              onTap: () {
                if (isOpen) {
                  zoomController.close!();
                  setState(() => isOpen = false);
                }
              },
              onPanUpdate: (details) {
                if (details.delta.dx < 0) {
                  zoomController.close!();
                  setState(() => isOpen = false);
                }
              },
              child: AbsorbPointer(
                absorbing: isOpen,
                child: Home(showMenu: () {
                  zoomController.open!();
                  setState(() => isOpen = true);
                }),
              ),
            ),
            borderRadius: 24.0,
            showShadow: true,
            angle: -12.0,
            backgroundColor: CustomColor.darkGreenAccent,
            slideWidth: MediaQuery.of(context).size.width * .45,
            openCurve: Curves.fastOutSlowIn,
            closeCurve: Curves.bounceIn,
          );
        if (state is HomeSplash) return SplashScreen();
        return Loading();
      },
    );
  }
}
