import 'package:flutter/material.dart';
import 'package:scanner/models/banned_category_model.dart';

class BannedCategoryCard extends StatelessWidget {
  const BannedCategoryCard({super.key, required this.bannedCategory});

  final ProductsModel bannedCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'مازال تحت التطوير',
          textAlign: TextAlign.right,
        )));

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
              opacity: 0.3,
              image: AssetImage(bannedCategory.img),
              fit: BoxFit.cover),
        ),
        child: Text(
          bannedCategory.name,
          maxLines: 3,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: 'ReadexPro'),
        ),
      ),
    );
  }
}
