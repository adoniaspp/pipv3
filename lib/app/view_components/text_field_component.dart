import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {

  TextFieldComponent({this.label, this.isHide=false});
  
  final String label;
  final bool isHide;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHide,
      decoration: InputDecoration(
        labelText: label,
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      )),
    );
  }
}
