import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomButtonApp extends StatelessWidget {
  const CustomButtonApp(
      {super.key, required this.text, required this.onPressed, this.color});

  final String text;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: color ?? AppColors.primaryColor.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.offwhite,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
