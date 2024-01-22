import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton(
      {super.key, required this.onPressed, required this.tipText, required this.iconData});

  final VoidCallback onPressed;
  final String tipText;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      foregroundColor: Colors.black,
      splashColor: Colors.black87,
      backgroundColor: Colors.white,
      tooltip: tipText,
      child: Icon(
        iconData,
        size: 32,
      ),
    );
  }
}
