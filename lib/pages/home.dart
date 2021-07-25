import 'package:peaceful_pet/config/colors.dart';
import 'package:peaceful_pet/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Function? showMenu;

  Home({
    Key? key,
    required this.showMenu,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> options = ["Ukojenie", "Wkurwienie", "Odnerwienie"];
  double opacity = 0;
  bool isDragged = false;

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      isAppBar: true,
      onBack: widget.showMenu,
      page: _body(),
    );
  }

  void onDrag() => setState(() => opacity = 1);

  void onDragEnd() => setState(() => opacity = 0);

  Widget _body() {
    double fullWidth = MediaQuery.of(context).size.width;
    double fullWidthMargin = MediaQuery.of(context).size.width - 32;
    double fullHeight = MediaQuery.of(context).size.height;
    double cardTopMargin = 212;

    return Container(
      width: fullWidth,
      height: fullHeight,
      child: Stack(
        children: [
          Positioned(
            top: 112,
            child: Container(
              width: fullWidthMargin,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => print('left arr'),
                    child: CustomRoundButton(
                      icon: Icons.keyboard_arrow_left,
                      size: 32,
                      isRound: true,
                      hasShadow: false,
                    ),
                  ),
                  Header(
                    text: 'Chomik',
                    fontWeight: FontWeight.w600,
                    showBottomText: false,
                  ),
                  GestureDetector(
                    onTap: () => print('right arr'),
                    child: CustomRoundButton(
                      icon: Icons.keyboard_arrow_right,
                      size: 32,
                      isRound: true,
                      hasShadow: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 500),
              child: DragTarget<int>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    width: fullWidthMargin,
                    height: 160,
                    child: Center(
                      child: CustomRoundButton(
                        icon: Icons.keyboard_arrow_down,
                      ),
                    ),
                  );
                },
                onAccept: (int data) {
                  List<String> temp = options;
                  String last = options[data];
                  temp.removeAt(data);
                  temp.insert(0, last);
                  setState(() => options = temp);
                },
              ),
            ),
          ),
          ...options.asMap().entries.map(
            (entry) {
              int index = entry.key;
              bool isLast = index == options.length - 1;
              bool isDragged = opacity == 1 && !isLast;

              return Positioned(
                top: cardTopMargin + (75 * index),
                child: AnimatedPadding(
                  duration: Duration(milliseconds: 500),
                  padding:
                      EdgeInsets.only(top: isDragged ? (10 * (index + 1)) : 0),
                  child: CustomCard(
                    header: entry.value,
                    index: index + 1,
                    isLast: isLast,
                    length: options.length,
                    width: fullWidthMargin,
                    onDrag: onDrag,
                    onDragEnd: onDragEnd,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
