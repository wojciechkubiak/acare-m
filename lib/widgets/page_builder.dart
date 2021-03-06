import 'package:peaceful_pet/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';

import 'widgets.dart';

class PageBuilder extends StatefulWidget {
  final bool isAppBar;
  final Widget page;
  final EdgeInsets margin;
  final ScrollController? controller;
  final Function? onBack;

  PageBuilder({
    Key? key,
    required this.page,
    required this.onBack,
    this.controller,
    this.isAppBar = false,
    this.margin = const EdgeInsets.only(left: 16, right: 16, bottom: 20),
  }) : super(key: key);

  @override
  _PageBuilderState createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      shouldAddCallbacks: true,
      onWillPop: () => widget.onBack!(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: LayoutBuilder(builder: (
                BuildContext context,
                BoxConstraints constraints,
              ) {
                return Center(
                  child: SingleChildScrollView(
                    controller: widget.controller,
                    child: Container(
                      margin: widget.margin,
                      child: widget.page,
                    ),
                  ),
                );
              }),
            ),
            if (widget.isAppBar)
              CustomAppBar(
                onBack: widget.onBack,
              ),
          ],
        ),
      ),
    );
  }
}
