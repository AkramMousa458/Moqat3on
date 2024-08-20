
import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({
    super.key, this.height,
  });
  final double? height;


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.only(
          top: 12,
          left: 10,
          right: 10,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 3,
              blurRadius: 30,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: height,
      ),
    );
  }
}
