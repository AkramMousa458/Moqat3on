import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/cubits/scan_cubit/scan_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/show_custom_snack_bar.dart';
import 'package:scanner/screens/home/widgets/custom_categories_scroll_item.dart';
import 'package:scanner/screens/scan/widgets/scan_choose_button.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool scanPhoto = true, scanNumber = false;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Material(
          color: AppColors.offwhite,
          child: ListView(
            physics: const BouncingScrollPhysics(),
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
                  if (state is ScanSuccsess) {
                    BlocProvider.of<ScanCubit>(context).scanResult != inText
                        ? showCustomSnackBar(
                            context: context, text: inText, status: false)
                        : showCustomSnackBar(
                            context: context, text: outText, status: false);
                    Navigator.of(context).pop();
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
                              ScanChooseButton(
                                text: 'إستخدام الكـاميرا',
                                iconData: FontAwesomeIcons.cameraRetro,
                                isCamera: true,
                              ),
                              SizedBox(height: 10),
                              ScanChooseButton(
                                text: 'إختيار من المعرض',
                                iconData: FontAwesomeIcons.image,
                                isCamera: false,
                              ),
                            ],
                          )
                        : const Column(
                            children: [],
                          ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
