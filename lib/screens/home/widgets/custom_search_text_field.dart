import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/screens/search/search_screen.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.onChanged,
  });

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textAlign: TextAlign.right,
      style: const TextStyle(
        height: 0.8,
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
        showSearch(context: context, delegate: SearchScreen());
      },
      decoration: InputDecoration(
        hintText: 'ابحث',
        hintStyle: const TextStyle(color: AppColors.redBlck),
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: AppColors.redBlck,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redBlck),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redBlck),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
