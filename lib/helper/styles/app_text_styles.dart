
import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomTextStyle {
  static const stylesFont500Size24 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.red,
  );

  static const stylesFont500Size22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
  static const stylesFont300Size16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
  static const stylesFont600Size28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
  static const stylesFont500Size16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.lightGrey,
  );
  static const stylesFont400Size13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.deepGrey,
  );
  static const stylesFont500Size14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

sizeHeight(double h) {
  return SizedBox(height: h);
}

sizeWidth(double w) {
  return SizedBox(width: w);
}
