import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubits/get_donate_cubit/get_donate_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/styles/app_text_styles.dart';
import 'package:scanner/models/donate_model.dart';
import 'package:scanner/screens/donate/widgets/custom_donate_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetDonateCubit()..getDonate(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              "اختر جهة التبرع",
              style: CustomTextStyle.stylesFont600Size28.copyWith(
                color: AppColors.redBlck,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<GetDonateCubit, GetDonateState>(
            builder: (context, state) {
              if (state is GetDonateFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              } else if (state is GetDonateSuccess) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: state.donateList.length,
                  itemBuilder: (context, index) {
                    return CustomDonateItem(
                      donateModel: state.donateList[index],
                    );
                  },
                );
              } else {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Skeletonizer(
                      enabled: true,
                      child: CustomDonateItem(
                        donateModel: DonateModel(name: '', image: '', url: ''),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
