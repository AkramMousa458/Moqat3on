import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

// ignore: must_be_immutable
class CustomTextFormFAuth extends StatelessWidget {
  CustomTextFormFAuth({
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
      padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "يجب إدخال البيانات أولاََ";
          }
          return null;
        },
        cursorColor: AppColors.lightGrey,
        style: const TextStyle(color: AppColors.lightGrey),
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffixIcon,
          labelStyle: const TextStyle(color: AppColors.primaryColor),
          border: customOutLineInputBorder(),
          enabledBorder: customOutLineInputBorder(),
          focusedBorder: customOutLineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder customOutLineInputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.lightGrey,
        ),
      );
}
