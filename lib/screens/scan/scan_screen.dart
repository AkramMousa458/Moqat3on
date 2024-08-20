import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/cubits/get_barcodes_cubit/get_barcodes_cubit.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/show_custom_snack_bar.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';
import 'package:scanner/screens/scan/widgets/scan_choose_button.dart';
import 'package:scanner/screens/scan/widgets/scan_text_field.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    BlocProvider.of<GetBarcodesCubit>(context)
      ..getCompaniesBarcodes()
      ..getCountriesBarcodes();
    super.initState();
  }

  bool scanPhoto = true, scanNumber = false;
  String barcode = '';
  @override
  Widget build(BuildContext context) {
    GetBarcodesCubit barcodesCubit = BlocProvider.of<GetBarcodesCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    scanNumber = true;
                    scanPhoto = false;
                  });
                },
                child: CustomCategoriesScrollItem(
                  text: 'إدخال باركود',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  isColor: scanNumber,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    scanPhoto = true;
                    scanNumber = false;
                  });
                },
                child: CustomCategoriesScrollItem(
                  text: 'مسح صورة',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  isColor: scanPhoto,
                ),
              ),
            ],
          ),
          BlocConsumer<ScanCubit, ScanState>(
            listener: (context, state) {
              if (state is ScanSuccsessCamera) {
                String result =
                    BlocProvider.of<ScanCubit>(context).scanResult;
                showCustomSnackBar(
                  context: context,
                  text: result,
                  status: result == inText ? true : false,
                );
                Navigator.of(context).pop();
              } else if (state is ScanSuccsessGallery) {
                String result =
                    BlocProvider.of<ScanCubit>(context).scanResult;
                showCustomSnackBar(
                  context: context,
                  text: result,
                  status: result == inText ? true : false,
                );
              } else if (state is ScanSuccsessNumber) {
                String result =
                    BlocProvider.of<ScanCubit>(context).scanResult;
                showCustomSnackBar(
                  context: context,
                  text: result,
                  status: result == inText ? true : false,
                );
              } else if (state is ScanFailed) {
                Navigator.pop(context);
                showCustomSnackBar(
                  context: context,
                  text: state.errMessage,
                  status: false,
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 45,
                ),
                child: scanPhoto
                    ? const Column(
                        children: [
                          SizedBox(height: 50),
                          ScanChooseButton(
                            text: 'إستخدام الكـاميرا',
                            iconData: FontAwesomeIcons.cameraRetro,
                            isCamera: true,
                          ),
                          // SizedBox(height: 10),
                          // ScanChooseButton(
                          //   text: 'إختيار من المعرض',
                          //   iconData: FontAwesomeIcons.image,
                          //   isCamera: false,
                          // ),
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 50),
                          const Text(
                            'من فضلك ادخل ال 13 رقم الخاص بالباركود من اليسار الى اليمين',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: AppColors.redBlck,
                            ),
                          ),
                          ScanTextField(
                            labelText: 'ادخل الباركود',
                            onChanged: (value) {
                              barcode = value;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.sizeOf(context).width / 5),
                            child: InkWell(
                              onTap: () {
                                if (barcode.length < 13) {
                                  showCustomSnackBar(
                                    context: context,
                                    text: 'تأكد ان رقم الباركود 13 رقم',
                                    status: false,
                                  );
                                } else {
                                  BlocProvider.of<ScanCubit>(context)
                                      .scanfromNumber(
                                    countriesBarcodes:
                                        barcodesCubit.countriesBarcodesList,
                                    companiesBarcodes:
                                        barcodesCubit.companiesBarcodesList,
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
                            ),
                          ),
                        ],
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}
