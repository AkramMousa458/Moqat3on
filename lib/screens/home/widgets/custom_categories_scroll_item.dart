
import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomCategoriesScrollItem extends StatelessWidget {
  const CustomCategoriesScrollItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        height: 80,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.redBlck),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.redBlck,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
