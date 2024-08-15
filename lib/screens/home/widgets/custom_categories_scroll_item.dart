import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomCategoriesScrollItem extends StatelessWidget {
  const CustomCategoriesScrollItem({
    super.key,
    required this.text,
    required this.isColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.width,
    this.height,
  });

  final String text;
  final bool isColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          width: width,
          height: height,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isColor ? AppColors.redBlck : null,
            border: Border.all(color: AppColors.redBlck),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: isColor ? AppColors.offwhite : AppColors.redBlck,
            ),
          ),
        ),
      ),
    );
  }
}
