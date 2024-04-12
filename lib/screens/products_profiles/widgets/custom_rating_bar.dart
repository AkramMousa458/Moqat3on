import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(' التقييمات :  $rating'),
        RatingBar(
          initialRating: rating,
          minRating: 1,
          maxRating: 5,
          onRatingUpdate: (value) {},
          ignoreGestures: true,
          itemCount: 5,
          itemSize: 25.0,
          allowHalfRating: true,
          ratingWidget: RatingWidget(
            empty: const Icon(Icons.star_border, color: Colors.amber),
            full: const Icon(Icons.star, color: Colors.amber),
            half: const Icon(Icons.star_half, color: Colors.amber),
          ),
        ),
      ],
    );
  }
}
