import 'package:flutter/material.dart';

import './../../config/colors.dart';

class Header extends StatelessWidget {
  final String text;
  final bool showBottomText;
  final FontWeight fontWeight;
  final EdgeInsets padding;

  const Header({
    Key? key,
    this.text = 'Animacare',
    this.showBottomText = true,
    this.fontWeight = FontWeight.w400,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 46,
              color: CustomColor.darkGreenAccent,
              fontFamily: 'Merienda',
              fontWeight: fontWeight,
            ),
          ),
          if (showBottomText)
            Text(
              'Your loved ones diary',
              style: TextStyle(fontSize: 10, color: CustomColor.mainAccent),
            ),
        ],
      ),
    );
  }
}
