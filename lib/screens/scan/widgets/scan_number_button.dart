import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/get_barcodes_cubit/get_barcodes_cubit.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/helper/show_custom_snack_bar.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';

class ScanNumberButton extends StatelessWidget {
  const ScanNumberButton({
    super.key,
    required this.barcode,
  });

  final String barcode;

  @override
  Widget build(BuildContext context) {
    GetBarcodesCubit barcodesCubit = BlocProvider.of<GetBarcodesCubit>(context);
    return InkWell(
      onTap: () {
        if (barcode.length < 13) {
          showCustomSnackBar(
            context: context,
            text: 'تأكد ان الباركود 13 رقم',
            status: false,
          );
        } else {
          BlocProvider.of<ScanCubit>(context).scanfromNumber(
            countriesBarcodes: barcodesCubit.countriesBarcodesList,
            companiesBarcodes: barcodesCubit.companiesBarcodesList,
            data: barcode,
          );
        }
      },
      borderRadius: const BorderRadius.all(
        Radius.circular(14),
      ),
      child: const CustomCategoriesScrollItem(
        text: 'بحث عن المنتج',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        isColor: true,
      ),
    );
  }
}
