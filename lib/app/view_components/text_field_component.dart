import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {

  TextFieldComponent({this.label, this.isHide=false, this.controller});
  
  final String label;
  final bool isHide;
  final controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isHide,
      decoration: InputDecoration(
        labelText: label,
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      )),
    );
  }
}
