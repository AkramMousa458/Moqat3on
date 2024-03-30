import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:scanner/helper/colors.dart';
import 'package:scanner/models/custom_notification_model.dart';
import 'package:scanner/models/duaa_model.dart';


class LocalNotification {
  static Timer? _timer;

  static Future<void> initNotification() async {
    AwesomeNotifications().initialize(
      'resource://drawable/launch_background',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic notifications',
          defaultColor: AppColors.redBlck,
          ledColor: Colors.white,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          enableLights: true,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          playSound: true,
          criticalAlerts: true,
          enableVibration: true,
          groupSort: GroupSort.Asc,
          ledOffMs: 1000,
          ledOnMs: 1000,
        ),
      ],
      debug: true,
    );

    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    _startPeriodicNotifications();
  }

  static void _startPeriodicNotifications() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) async {
      DuaaModel duaa = getRandomDuaa();
      await createNotification(
        notification: CustomNotificationModel(
          id: duaa.id,
          title: 'لا تنسوا الدعاء لأهلنا في غزة',
          description: duaa.text,
        ),
      );
    });
  }

  static Future<void> createNotification(
      {required CustomNotificationModel notification}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        channelKey: 'basic_channel',
        title: notification.title,
        body: notification.description,
        actionType: ActionType.DismissAction,
        notificationLayout: NotificationLayout.Default,
        wakeUpScreen: true,
        autoDismissible: true,
        category: NotificationCategory.Reminder,
      ),
    );
  }

  // Don't forget to implement getRandomDuaa method and dispose the timer when not needed
}
