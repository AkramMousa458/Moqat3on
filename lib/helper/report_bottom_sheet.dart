import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/core/api_service.dart';
import 'package:scanner/cubits/add_report_cubit/add_report_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/show_custom_snack_bar.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/models/report_model.dart';
import 'package:scanner/widgets/custom_button.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';

void showReportBottomSheet(
    {required BuildContext context, required ProductModel productModel}) {
  TextEditingController messageController = TextEditingController();
  bool isLoading = false;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => AddReportCubit(ApiService(Dio())),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: DraggableScrollableSheet(
            initialChildSize: 0.6,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  controller: scrollController,
                  child: Column(
                    children: [
                      Container(
                        height: 6,
                        width: 50,
                        margin: const EdgeInsets.only(top: 5, bottom: 25),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: messageController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: "الإبلاغ عن المنتج",
                            hintText: "اكتب الخطأ في معلومات المنتج لتصحيحه",
                            labelStyle: const TextStyle(
                              color: AppColors.redBlck,
                            ),
                            hintStyle: const TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            prefixIcon: const Icon(Icons.message),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.redBlck)),
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        'ملحوظة : سيتم إرسال معلومات المنتج مع الإبلاغ',
                        style: CustomTextStyle.stylesFont300Size16
                            .copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocConsumer<AddReportCubit, AddReportState>(
                            listener: (context, state) {
                              if (state is AddReportFailure) {
                                Navigator.pop(context);
                                isLoading = false;
                                print(state.errMessage);
                                showCustomSnackBar(
                                  context: context,
                                  text: state.errMessage,
                                  status: false,
                                );
                              } else if (state is AddReportSuccsess) {
                                isLoading = false;
                                showCustomSnackBar(
                                  context: context,
                                  text: 'تم إرسال البلاغ بنجاح',
                                  status: true,
                                );
                              } else {
                                isLoading = true;
                              }
                            },
                            builder: (context, state) {
                              return isLoading
                                  ? const Center(
                                      child: CustomLoadingWidget(),
                                    )
                                  : CustomButton(
                                      text: 'إرسال',
                                      backgroundColor: AppColors.lightGrey,
                                      height: 60,
                                      onTap: () {
                                        if (messageController.text.isNotEmpty) {
                                          log(productModel.id.toString());
                                          BlocProvider.of<AddReportCubit>(
                                                  context)
                                              .addReport(
                                                report: ReportModel(
                                                  productId: productModel.id,
                                                  message:
                                                      messageController.text,
                                                ),
                                              )
                                              .then((value) =>
                                                  Navigator.pop(context));
                                        } else {
                                          showCustomSnackBar(
                                            context: context,
                                            text: 'يجب كتابة سبب البلاغ أولاََ',
                                            status: false,
                                          );
                                        }
                                      },
                                      textSize: 20,
                                      width:
                                          MediaQuery.sizeOf(context).width / 3,
                                    );
                            },
                          ),
                          const SizedBox(width: 10),
                          CustomButton(
                            text: 'إلغاء',
                            height: 60,
                            textColor: AppColors.white,
                            backgroundColor: AppColors.redBlck,
                            textSize: 20,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            width: MediaQuery.sizeOf(context).width / 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
