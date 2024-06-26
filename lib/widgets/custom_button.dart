import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.black,
    this.width = 250,
    this.height = 70,
    this.textSize = 25,
  });

  final String text;
  final VoidCallback onTap;
  final double width, height, textSize;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(150),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
