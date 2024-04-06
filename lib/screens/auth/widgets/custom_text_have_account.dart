import 'package:flutter/material.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';

class CustomTextHaveAccount extends StatelessWidget {
  const CustomTextHaveAccount(
      {super.key,
      required this.textAlready,
      required this.textlogin,
      this.onTap});
  final String textAlready;
  final String textlogin;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Text(
              textlogin,
              style: CustomTextStyle.stylesFont500Size16.copyWith(
                color: Colors.red,
              ),
            ),
          ),
          Text(
            textAlready,
            style: CustomTextStyle.stylesFont500Size16,
          ),
        ],
      ),
    );
  }
}
