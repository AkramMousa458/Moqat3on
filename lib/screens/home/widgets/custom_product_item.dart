import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/navigation.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customNavigate(context, '/productScreen');
      },
      child: Container(
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
                child:
                    // Image.network(
                    //   'https://artwork.anghcdn.co/webp/?id=17272407&size=296',
                    //   width: 135,
                    //   height: 100,
                    //   fit: BoxFit.cover,
                    // ),
                    Image.asset(
                  "assets/products/مطاعم/كنتاكي.jpg",
                  width: 135,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              'كنتاكي',
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
      ),
    );
  }
}
