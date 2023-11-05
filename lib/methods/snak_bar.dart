import 'package:flutter/material.dart';

void snakBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: Colors.blueGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontFamily: 'ReadexPro'),
        ),
      ),
    );
  }