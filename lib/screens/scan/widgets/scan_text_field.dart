import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

// ignore: must_be_immutable
class ScanTextField extends StatelessWidget {
  ScanTextField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
  });

  final String labelText;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: TextField(
        maxLength: 13,
        keyboardType: TextInputType.number,
        cursorColor: AppColors.deepGrey,
        style: TextStyle(color: AppColors.redBlck),
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffixIcon,
          labelStyle: TextStyle(
            color: AppColors.redBlck,
          ),
          border: customOutLineInputBorder(),
          enabledBorder: customOutLineInputBorder(),
          focusedBorder: customOutLineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder customOutLineInputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.redBlck,
        ),
      );
}
