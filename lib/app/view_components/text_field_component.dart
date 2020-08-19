import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {

  TextFieldComponent({this.label, this.isHide=false, this.controller, this.validator});
  
  final String label;
  final bool isHide;
  final controller;
  final validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
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
