import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class CustomLinkIcon extends StatelessWidget {
  const CustomLinkIcon({
    super.key,
    required this.icon,
    required this.url,
  });

  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Link(
        uri: Uri.parse(url),
        target: LinkTarget.blank,
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        builder: (context, FollowLink) {
          return IconButton(
            onPressed: FollowLink,
            icon: Icon(icon),
            iconSize: 55,
          );
        });
  }
}