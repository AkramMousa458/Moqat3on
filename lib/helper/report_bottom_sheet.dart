import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/add_report_cubit/add_report_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/show_custom_snack_bar.dart';
import 'package:scanner/models/product_model.dart';
import 'package:scanner/widgets/custom_button.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';

void showReportBottomSheet(
    {required BuildContext context, required ProductModel productModel}) {
  bool isLoading = false;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocProvider(
        create: (context) => AddReportCubit(),
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
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: "Your Message",
                            hintText: "Type your message here",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            prefixIcon: const Icon(Icons.message),
                          ),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
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
                                showCustomSnackBar(
                                  context: context,
                                  text: state.errMessage,
                                  status: false,
                                );
                              } else if (state is AddReportSuccsess) {
                                Navigator.pop(context);
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
                                      onTap: () {},
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
