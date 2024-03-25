import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://artwork.anghcdn.co/webp/?id=17272407&size=296',
                width: 135,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Text(
            'بيبسي',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'مقاطعة',
            style: TextStyle(color: AppColors.redBlck),
          ),
        ],
      ),
    );
  }
}
