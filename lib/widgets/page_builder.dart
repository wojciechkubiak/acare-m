import 'package:flutter/material.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';

import 'widgets.dart';

class PageBuilder extends StatefulWidget {
  final bool isAppBar;
  final Widget? page;
  final ScrollController? controller;
  final EdgeInsets margin;
  final Function? onBack;

  PageBuilder({
    Key? key,
    this.isAppBar = true,
    this.page,
    this.controller,
    this.onBack,
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
            if (widget.isAppBar)
              CustomAppBar(
                onBack: () => widget.onBack!(),
              ),
            Container(
              padding: EdgeInsets.only(top: 80),
              width: double.infinity,
              height: double.infinity,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  controller: widget.controller,
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight -
                          widget.margin.top -
                          widget.margin.bottom,
                    ),
                    margin: widget.margin,
                    child: widget.page,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
