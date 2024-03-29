import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan/scan.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/helper/colors.dart';

ScanController controller = ScanController();

AppBar barcodeScannerAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      'مسح المنتج',
      style: TextStyle(color: AppColors.white),
    ),
    elevation: 0.0,
    centerTitle: true,
    backgroundColor: Colors.black,
    leading: GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: const Center(
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    ),
    actions: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 16.0),
        child: IconButton(
          onPressed: () async {
            controller.toggleTorchMode();
          },
          icon: const Icon(
            Icons.flashlight_on_sharp,
          ),
          iconSize: 25,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget barcodeScannerBody(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 1.3,
    child: ScanView(
      controller: controller,
      scanAreaScale: .7,
      scanLineColor: Colors.red,
      onCapture: (data) {
        BlocProvider.of<ScanCubit>(context).scanfromCamera(data);
      },
    ),
  );
}
