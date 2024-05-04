import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2.0, // Adjust the thickness of the circle
      color: AppColors.redBlck, // Change the color
      backgroundColor: Colors.grey[200], // Set the background color
    );
  }
}
