import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      required this.color,
      this.isBold = false,
      this.textAlign = TextAlign.center});
      

  final String text;
  final double size;
  final Color color;
  final bool isBold;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontFamily: 'ReadexPro',
      ),
    );
  }
}
