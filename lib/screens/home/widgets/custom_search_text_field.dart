import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.onChanged,
    required this.goSearch,
  });

  final Function(String) onChanged;
  final bool goSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textAlign: TextAlign.right,
      style: const TextStyle(
        height: 0.8,
      ),
      onTap: () {
        if (goSearch) customNavigate(context, '/search');
      },
      decoration: InputDecoration(
        hintText: 'ابحث',
        hintStyle: TextStyle(color: AppColors.redBlck),
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: AppColors.redBlck,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redBlck),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redBlck),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
