import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

import './../config/colors.dart';
import './../widgets/spinner.dart';

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
          AnimatedContainer(
            duration: Duration(seconds: 1),
            child: Lottie.asset('assets/lotties/splash.json'),
          ),
          Column(
            children: [
              Text(
                'Animacare',
                style: TextStyle(
                    fontSize: 46,
                    color: CustomColor.darkGreenAccent,
                    fontFamily: 'Merienda'),
              ),
              Text(
                'Your loved ones diary',
                style: TextStyle(fontSize: 10, color: CustomColor.mainAccent),
              ),
            ],
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            child: Spinner(),
          ),
        ],
      ),
    );
  }
}
