import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  // Button's name
  final String text;

  // Method for on pressed (it returns nothing)
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
      child: Text(text, style: TextStyle(color: Colors.white),),
    );
  }
}