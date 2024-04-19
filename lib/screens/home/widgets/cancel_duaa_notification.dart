import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/helper/colors.dart';

class CancelDuaaNotifiaction extends StatelessWidget {
  const CancelDuaaNotifiaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          // color: AppColors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(FontAwesomeIcons.bell),
                SizedBox(width: 10),
                Text(
                  'إشعارات الدعاء',
                  style: TextStyle(fontSize: 18),
                  // style: ,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.ban),
              color: AppColors.redBlck,
              iconSize: 22,
            ),
          ],
        ),
      ),
    );
  }
}
