import 'package:flutter/material.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';

class CustomTextHaveAccount extends StatelessWidget {
  const CustomTextHaveAccount(
      {super.key, required this.textAlready, required this.textlogin, this.onTap});
  final String textAlready;
  final String textlogin;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: textAlready,
                style:  CustomTextStyle.stylesFont500Size16,
              ),
              TextSpan(
                text: textlogin,
                style: CustomTextStyle.stylesFont500Size16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
