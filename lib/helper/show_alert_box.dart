import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';

Future<dynamic> showAlertBox({
  required BuildContext context,
  required String bodyText,
  required String confirmText,
  required VoidCallback confirmAction,
  required IconData icon,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext cxt) {
      return Dialog(
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  // Icons.logout,
                  icon,
                  color: AppColors.redBlck,
                  size: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  bodyText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.redBlck,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CustomCategoriesScrollItem(
                        text: 'إلغاء',
                        fontSize: 20,
                        isColor: false,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: confirmAction,
                      child: CustomCategoriesScrollItem(
                        text: confirmText,
                        fontSize: 20,
                        isColor: true,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
