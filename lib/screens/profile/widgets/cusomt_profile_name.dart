import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomProfileName extends StatelessWidget {
  const CustomProfileName({
    super.key,
    required this.text,
    this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.white),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
