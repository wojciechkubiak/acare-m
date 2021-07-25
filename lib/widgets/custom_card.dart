import 'package:anima/config/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String header;
  final int index;
  final double width;
  final bool isLast;
  final int length;
  final Function onDrag;
  final Function onDragEnd;

  const CustomCard({
    Key? key,
    required this.header,
    required this.index,
    required this.width,
    required this.isLast,
    required this.length,
    required this.onDrag,
    required this.onDragEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scale = index / length;

    return Transform.scale(
      scale: scale,
      child: AbsorbPointer(
        absorbing: !isLast,
        child: Draggable<int>(
          data: index - 1,
          axis: Axis.vertical,
          feedback: _card(),
          child: _card(),
          childWhenDragging: Container(),
          onDragStarted: () => onDrag(),
          onDragCompleted: () => onDragEnd(),
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      width: width,
      child: Card(
        elevation: index * 1.0,
        color:
            isLast ? Colors.white : CustomColor.darkGreenAccent.withAlpha(255),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      header,
                      style: TextStyle(
                        fontSize: 28,
                        color: isLast ? Colors.black54 : Colors.white,
                        fontFamily: 'Merienda',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info,
                      color: isLast ? Colors.black54 : Colors.white,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Bitrate:',
                      style: TextStyle(
                        color: isLast ? Colors.black45 : Colors.white,
                      ),
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        inactiveTrackColor: isLast
                            ? CustomColor.mainAccent.withOpacity(0.4)
                            : Colors.white24,
                        trackHeight: 6,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 14),
                      ),
                      child: Slider(
                        activeColor:
                            isLast ? CustomColor.mainAccent : Colors.white54,
                        value: 0,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        isLast ? CustomColor.darkGreenAccent : Colors.white,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.play_arrow,
                    size: 32,
                    color: isLast ? Colors.white : CustomColor.darkGreenAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
