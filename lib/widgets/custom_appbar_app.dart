import 'package:flutter/material.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';

class CustomAppBAr extends StatelessWidget {
  const CustomAppBAr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Image.asset(
          'assets/images/hand.png',
          width: 50,
          height: 50,
        ),
        sizeWidth(16)
      ],
      title: const Text(
        "مقاطعة",
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
