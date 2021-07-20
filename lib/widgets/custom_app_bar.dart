import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function onBack;

  const CustomAppBar({
    Key? key,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.white,
      // decoration: BoxDecoration(color: Colors.white, boxShadow: [
      //   BoxShadow(
      //     blurRadius: 2,
      //     color: Colors.black12,
      //     spreadRadius: 2,
      //     offset: Offset(1, 1),
      //   )
      // ]),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 50,
            padding: EdgeInsets.only(top: 22),
            child: IconButton(
              onPressed: () => onBack,
              icon: Icon(
                Icons.menu,
                size: 42,
                color: Colors.black87,
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
