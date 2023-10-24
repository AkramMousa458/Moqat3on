import 'package:flutter/material.dart';
import 'package:scanner/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.screen});

  final Widget screen;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return screen;
          }));
        },
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          width: 180,
          height: 60,
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
