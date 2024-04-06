import 'package:flutter/material.dart';

showBottomSnackBar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.right,
      ),
    ),
  );
}
