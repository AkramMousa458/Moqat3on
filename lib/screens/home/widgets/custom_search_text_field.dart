import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key, required this.oonChanged,
  });

  final Function(String) oonChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: oonChanged,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: 'ابحث',
        hintStyle: TextStyle(color: AppColors.redBlck),
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: AppColors.redBlck,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redBlck),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redBlck),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
