import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onButtonPressed;

  MyButton({super.key, required this.text, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onButtonPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}