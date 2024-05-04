import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanner/cubits/notification_cubit/notification_cubit.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/helper/notification_enum.dart';
import 'package:scanner/helper/show_alert_box.dart';

bool activated = false;

class CancelDuaaNotifiactionWidget extends StatelessWidget {
  const CancelDuaaNotifiactionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NotificationCubit notificationCubit =
        BlocProvider.of<NotificationCubit>(context);
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
            BlocBuilder<NotificationCubit, NotificationState>(
              builder: (context, state) {
                return Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: state is NotificationActivated ? true : false,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      if (!value) {
                        showAlertBox(
                          context: context,
                          icon: FontAwesomeIcons.circleExclamation,
                          bodyText: 'هل تريد حقا إلغاء إشعارات الدعاء',
                          confirmText: 'نعم',
                          confirmAction: () {
                            notificationCubit.changeNotificationStatus(notificationStatus: NotificationEnum.deactivate);
                            Navigator.pop(context);
                          },
                        );
                      } else {
                        notificationCubit.changeNotificationStatus(notificationStatus: NotificationEnum.activate);
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
