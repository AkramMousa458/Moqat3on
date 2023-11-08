import 'package:flutter/material.dart';
import 'package:scanner/models/banned_category_model.dart';

late double screenWidth;

class BannedCategoryCard extends StatelessWidget {
  const BannedCategoryCard({super.key, required this.bannedCategory});

  final BannedCategoryModel bannedCategory;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return bannedCategory.screen;
        }));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
          image: DecorationImage(
              opacity: 0.5,
              image: AssetImage(bannedCategory.img),
              fit: BoxFit.cover),
        ),
        child: Text(
          bannedCategory.name,
          maxLines: 3,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth > 1200
                  ? 70
                  : screenWidth > 600
                      ? 62
                      : screenWidth > 300
                          ? 25
                          : 16,
              fontFamily: 'ReadexPro'),
        ),
      ),
    );
  }
}
