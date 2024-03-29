import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/widgets/show_barcode_scanner.dart';

class ScanChooseButton extends StatelessWidget {
  const ScanChooseButton({
    super.key,
    required this.text,
    required this.iconData, required this.isCamera,
  });

  final String text;
  final IconData iconData;
  final bool isCamera;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      onPressed: () {
        isCamera?  barcodeScanner(context) : BlocProvider.of<ScanCubit>(context).scanfromGallery();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.redBlck),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  iconData,
                  size: 50,
                  color: AppColors.redBlck,
                ),
                Text(
                  text,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.redBlck,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
