import 'package:flutter/material.dart';
import 'package:scanner/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              productModel.img,
              scale: 4,
            ),
          ),
          Expanded(
            child: Text(
              productModel.name,
              maxLines: 3,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'ReadexPro'),
            ),
          ),
        ],
      ),
    );
  }
}
