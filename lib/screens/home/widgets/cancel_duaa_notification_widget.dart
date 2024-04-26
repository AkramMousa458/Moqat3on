import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/cubits/settings_cubit/settings_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/show_alert_box.dart';
import 'package:scanner/helper/show_custom_snack_bar.dart';
import 'package:scanner/widgets/custom_loading_widget.dart';

bool isLoading = false;
bool activateNotification = false;

class CancelDuaaNotifiactionWidget extends StatelessWidget {
  const CancelDuaaNotifiactionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SettingsCubit settingsCubit = BlocProvider.of<SettingsCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
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
                  'تفعيل إشعارات الدعاء',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            BlocConsumer<SettingsCubit, SettingsState>(
              listener: (context, state) {
                if (state is SettingsFailure) {
                  isLoading = false;
                  showCustomSnackBar(
                    context: context,
                    text: state.errMessage,
                    status: false,
                  );
                } else if (state is SettingsSuccess) {
                  isLoading = false;
                  activateNotification = state.activateNotification;
                } else {
                  isLoading = true;
                }
              },
              builder: (context, state) {
                return isLoading
                    ? const CustomLoadingWidget()
                    : Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          value: activateNotification,
                          activeColor: AppColors.primaryColor,
                          onChanged: (value) {
                            if (settingsCubit.activateNotification) {
                              showAlertBox(
                                context: context,
                                icon: FontAwesomeIcons.circleExclamation,
                                bodyText: 'هل تريد حقا إلغاء إشعارات الدعاء',
                                confirmText: 'نعم',
                                confirmAction: () {
                                  settingsCubit.canelDuaaNotification();
                                  Navigator.pop(context);
                                },
                              );
                            } else {
                              settingsCubit.activateDuaaNotification();
                            }
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
