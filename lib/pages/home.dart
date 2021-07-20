import 'package:anima/config/colors.dart';
import 'package:anima/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      isNavigationVisible: true,
      isAppBar: true,
      onBack: () => print('back'),
      page: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Header(
          text: 'Chomik',
          fontWeight: FontWeight.w600,
          showBottomText: false,
          padding: EdgeInsets.only(bottom: 32),
        ),
        _card(),
      ],
    );
  }

  Widget _card() {
    return Container(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 24),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Ukojenie',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black54,
                        fontFamily: 'Merienda',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.info, color: Colors.black54),
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
                        color: Colors.black45,
                      ),
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        inactiveTrackColor:
                            CustomColor.mainAccent.withOpacity(0.4),
                        trackHeight: 6,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 14),
                      ),
                      child: Slider(
                        activeColor: CustomColor.mainAccent,
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
                    primary: CustomColor.darkGreenAccent,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(8),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.play_arrow,
                    size: 32,
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
