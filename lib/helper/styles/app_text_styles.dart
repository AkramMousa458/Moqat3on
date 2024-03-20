// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomTextStyle {
  static final stylesFont400Size64 = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: AppColors.deepBrown,
    fontFamily: "Pacifico",
  );
  static final stylesFont500Size24 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: 'Poppins',
  );

  static final stylesFont400Size22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: AppColors.deepBrown,
    fontFamily: 'Pacifico',
  );
  static final stylesFont300Size16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
  static final stylesFont600Size28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.deepBrown,
    fontFamily: "Pacifico",
  );
  static final stylesFont500Size16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
  static final stylesFont400Size13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.deepGrey,
  );
  static final stylesFont500Size14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.deepBrown,
  );
}

sizeHeight(double h) {
  return SizedBox(height: h);
}

sizeWidth(double w) {
  return SizedBox(width: w);
}
