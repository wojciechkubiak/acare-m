import 'package:flutter/material.dart';

import './../../config/colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Animacare',
          style: TextStyle(
            fontSize: 46,
            color: CustomColor.darkGreenAccent,
            fontFamily: 'Merienda',
          ),
        ),
        Text(
          'Your loved ones diary',
          style: TextStyle(fontSize: 10, color: CustomColor.mainAccent),
        ),
      ],
    );
  }
}
