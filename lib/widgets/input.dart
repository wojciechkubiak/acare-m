import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController textEditingController;
  final EdgeInsets padding;

  Input({
    Key? key,
    this.isPassword = false,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    required this.label,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.label,
        ),
      ),
    );
  }
}
