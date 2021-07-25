import 'package:peaceful_pet/config/colors.dart';
import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final bool isRound;
  final bool hasShadow;

  const CustomRoundButton({
    Key? key,
    required this.icon,
    this.size = 48,
    this.isRound = false,
    this.hasShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: !isRound ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: !isRound ? null : BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  blurRadius: 2,
                  color: Colors.black12,
                  spreadRadius: 2,
                  offset: Offset(1, 1),
                )
              ]
            : null,
      ),
      child: Icon(
        icon,
        size: size,
        color: CustomColor.darkGreenAccent,
      ),
    );
  }
}
