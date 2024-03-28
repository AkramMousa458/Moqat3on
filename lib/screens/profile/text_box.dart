import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({
    super.key,
    required this.sectionName,
    required this.text,
    required this.onPressed,
  });
  final String sectionName;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                sectionName,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.edit_calendar),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Text(text),
        ],
      ),
    );
  }
}
