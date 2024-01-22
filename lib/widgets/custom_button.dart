import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.width = 250,
    this.height = 70,
    this.textSize = 25,
  });

  final String text;
  final VoidCallback onTap;
  final double width, height, textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(150),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "ReadexPro",
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
