import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: CachedNetworkImageProvider(
            url,
            errorListener: (p0) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
