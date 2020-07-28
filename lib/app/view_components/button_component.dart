import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent({this.icon, this.action, this.label});

  final icon;
  final action;
  final label;

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
        icon: icon,
        onPressed: action,
        label: label,
        padding: EdgeInsets.only(right: 60, left: 60, top: 10, bottom: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)))
        );
  }
}
