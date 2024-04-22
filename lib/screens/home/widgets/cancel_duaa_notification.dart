import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/cubits/settings_cubit/settings_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/show_alert_box.dart';

class CancelDuaaNotifiaction extends StatefulWidget {
  const CancelDuaaNotifiaction({
    super.key,
  });

  @override
  State<CancelDuaaNotifiaction> createState() => _CancelDuaaNotifiactionState();
}

class _CancelDuaaNotifiactionState extends State<CancelDuaaNotifiaction> {
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
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: settingsCubit.activateNotification,
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
                      setState(() {});
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
