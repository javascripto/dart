import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final IconData? icon;
  final String? hint;
  final String? label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  Editor({ this.icon, this.hint, this.label, this.keyboardType, this.controller });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: icon != null
          ? Icon(
            icon,
            color: Theme.of(context).accentColor,
          )
          : null,
        hintStyle: TextStyle(
          color: Theme.of(context).accentColor,
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).accentColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
