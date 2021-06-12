import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/colors.dart';

class Spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitFoldingCube(
      size: 50,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven
                ? CustomColor.mainAccent
                : CustomColor.secondaryAccent,
          ),
        );
      },
    );
  }
}
