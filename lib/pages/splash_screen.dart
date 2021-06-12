import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import './../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset('assets/lotties/splash.json'),
          Column(
            children: [
              Header(),
            ],
          ),
          Spinner(),
        ],
      ),
    );
  }
}
