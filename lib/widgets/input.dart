import 'package:anima/config/colors.dart';
import 'package:flutter/material.dart';

enum InputType { NAME, PASSWORD, EMAIL, PHONE }

extension validators on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = new RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

class Input extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextEditingController textEditingController;
  final EdgeInsets padding;
  final bool isEnabled;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final InputType inputType;

  Input({
    Key? key,
    this.isPassword = false,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.isEnabled = true,
    this.textInputType = TextInputType.name,
    this.textInputAction = TextInputAction.done,
    this.inputType = InputType.NAME,
    required this.label,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String error = '';

  InputBorder getInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: color,
        width: 2,
        style: BorderStyle.solid,
      ),
    );
  }

  void validateInput(InputType type, String text) {
    String validation = '';

    print('$type $text');

    switch (type) {
      case InputType.EMAIL:
        validation = text.isValidEmail ? '' : 'Wprowadź poprawny adres email';
        break;
      case InputType.PASSWORD:
        validation = text.isValidPassword ? '' : 'Wprowadź poprawne hasło';
        break;
      default:
        validation = '';
        break;
    }

    setState(() => error = validation);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        children: [
          TextFormField(
            controller: widget.textEditingController,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            onChanged: (value) => validateInput(widget.inputType, value),
            style: TextStyle(
              fontSize: 17,
              color: Colors.black87,
            ),
            cursorColor: CustomColor.darkGreenAccent,
            obscureText: widget.isPassword,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.label,
              labelStyle: TextStyle(
                fontSize: 17,
                color: CustomColor.darkGreenAccent,
              ),
              enabled: widget.isEnabled,
              border: getInputBorder(Colors.black54),
              enabledBorder:
                  getInputBorder(CustomColor.mainAccent.withOpacity(0.4)),
              errorBorder: getInputBorder(Colors.red),
              focusedBorder: getInputBorder(CustomColor.mainAccent),
              disabledBorder: getInputBorder(Colors.black54),
              focusedErrorBorder: getInputBorder(Colors.red),
            ),
          ),
          Text(error),
        ],
      ),
    );
  }
}
