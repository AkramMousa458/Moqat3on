import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scanner/constants.dart';
import 'package:scanner/helper/notification_enum.dart';
import 'package:scanner/helper/work_manager_service.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  bool notification = false;
  final WorkManagerService workManagerService = WorkManagerService();

  void changeNotificationStatus(
      {required NotificationEnum notificationStatus}) async {
    switch (notificationStatus) {
      case NotificationEnum.initial:
        if (prefs!.getBool('notification') != null) {
          prefs!.getBool('notification') == false
              ? {
                  notification = false,
                  log('from initial notification false'),
                  emit(NotificationDeactivated()),
                }
              : {
                  notification = true,
                  log('from initial notification true'),
                  emit(NotificationActivated()),
                };
        }
        break;
      case NotificationEnum.activate:
        {
          workManagerService.init();
           log('from activate notification true');
          prefs!.setBool('notification', true);
          notification = true;
          emit(NotificationActivated());
        }
        break;
      case NotificationEnum.deactivate:
        {
          workManagerService.stopNotification();
          log('from deactivate notification false');
          prefs!.setBool('notification', false);
          notification = false;
          emit(NotificationDeactivated());
        }
        break;
      default:
    }
  }

  // Future<void> canelDuaaNotification() async {
  //   try {
  // workManagerService.stopNotification();
  //     Future.wait({
  //       NotificationSharedPreferences.setNotification(false),
  //       getNotificationValue(),
  //     });

  //     emit(SettingsSuccess(false));
  //   } catch (e) {
  //     emit(SettingsFailure(errMessage: 'Error in cancel notification: $e'));
  //   }
  // }

  // Future<void> activateDuaaNotification() async {
  //   try {
  //     workManagerService.init();
  //     Future.wait({
  //       NotificationSharedPreferences.setNotification(true),
  //       getNotificationValue(),
  //     });
  //     emit(SettingsSuccess(true));
  //   } catch (e) {
  //     emit(SettingsFailure(errMessage: 'Error in activate notification: $e'));
  //   }
  // }

  // Future<void> getNotificationValue() async {
  //   activateNotification =
  //       await NotificationSharedPreferences.getNotification() ?? true;
  //   emit(SettingsSuccess(activateNotification));
  // }
}
