import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:scanner/models/custom_notification_model.dart';
import 'package:scanner/models/duaa_model.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static onTap(NotificationResponse notificationResponse) {}

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static Future<void> showNotification(
      {required CustomNotificationModel notificationModel}) async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
      'id 0',
      'Basic notificaion',
      importance: Importance.high,
      priority: Priority.high,
      fullScreenIntent: true,
    ));
    flutterLocalNotificationsPlugin.show(
      notificationModel.id,
      notificationModel.title,
      notificationModel.description,
      notificationDetails,
    );
  }

  static Future<void> showDuaaNotification({required DuaaModel duaaModel}) async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
      'id 0',
      'Basic notificaion',
      importance: Importance.high,
      priority: Priority.high,
      fullScreenIntent: true,
    ));
    flutterLocalNotificationsPlugin.show(
      0,
      'لا تنسوا الدعاء لأهلنا في غزة',
      duaaModel.text,
      notificationDetails,
    );
  }

  // static Future<void> showRepeatedNotification() async {
  //   NotificationDetails notificationDetails = const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //     'id 1',
  //     'Repeated notificaion',
  //     importance: Importance.high,
  //     priority: Priority.high,
  //     fullScreenIntent: true,
  //   ));
  //   DuaaModel duaa = getRandomDuaa();
  //   flutterLocalNotificationsPlugin.periodicallyShow(
  //     1,
  //     'لا تنسوا الدعاء لأهلنا في غزة',
  //     duaa.text,
  //     RepeatInterval.everyMinute,
  //     notificationDetails,
  //   );
  // }

  static Future<void> stopDuaaNotification() async {
    flutterLocalNotificationsPlugin.cancel(1);
  }
}
