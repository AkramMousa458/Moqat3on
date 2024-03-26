import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scanner/helper/local_notification.dart';
import 'package:scanner/models/custom_notification_model.dart';

class FirebaseNotification {
  static final _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    if (kDebugMode) {
      print("Handling a background message Done!");
    }
  }

  static Future<void> initNotificaitons() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      sound: true,
      provisional: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User accept notification');
      }
    }
    final String? fcmToken = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print("User Notification Token : $fcmToken");
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static void getNotification({required BuildContext context}) async {
    try {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        LocalNotification.createNotification(
            notification: CustomNotificationModel(
          id: 0,
          title: message.notification?.title ?? 'Moqata3a|مقاطعة',
          description: message.notification?.body ??
              'يوجد تحديث للأبلكيشن, لا تنسي لكي تكون علي علم بكل المنتجات المقاطعة',
        ));
        // showCustomSnackBar(
        //     context: context,
        //     text: '${message.notification?.body}',
        //     status: true);
        if (kDebugMode) {
          print('Title : ${message.notification?.title}');
          print('Text : ${message.notification?.body}');
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('Erorr->>>>>>> ${e.toString()}');
      }
    }
  }
}


/////////Work on background

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:scanner/helper/local_notification.dart';
// import 'package:scanner/models/custom_notification_model.dart';

// class FirebaseNotification {
//   static final _firebaseMessaging = FirebaseMessaging.instance;

//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     if (kDebugMode) {
//       print("Handling a background message: ${message.messageId}");
//     }

//     // Initialize Flutter bindings as this method might be called before runApp()
//     WidgetsFlutterBinding.ensureInitialized();

//     // Handle the message
//     LocalNotification.createNotification(
//       notification: CustomNotificationModel(
//         id: 0,
//         title: message.notification?.title ?? 'Moqata3a|مقاطعة',
//         description: message.notification?.body ??
//             'يوجد تحديث للأبلكيشن, لا تنسي لكي تكون علي علم بكل المنتجات المقاطعة',
//       ),
//     );
//   }

//   static Future<void> initNotifications() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       if (kDebugMode) {
//         print('User accepted notifications');
//       }
//     }

//     final String? fcmToken = await _firebaseMessaging.getToken();
//     if (kDebugMode) {
//       print("User Notification Token : $fcmToken");
//     }

//     // Register background message handler
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }

//   static void getNotifications() async {
//     try {
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         LocalNotification.createNotification(
//           notification: CustomNotificationModel(
//             id: 0,
//             title: message.notification?.title ?? 'Moqata3a|مقاطعة',
//             description: message.notification?.body ??
//                 'يوجد تحديث للأبلكيشن, لا تنسي لكي تكون علي علم بكل المنتجات المقاطعة',
//           ),
//         );
//         if (kDebugMode) {
//           print('Title : ${message.notification?.title}');
//           print('Text : ${message.notification?.body}');
//         }
//       });

//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         // Handle notification tap when the app is in the background
//         // For example, you can navigate to a specific screen
//         if (kDebugMode) {
//           print('Notification tapped: ${message.notification?.title}');
//         }
//       });

//       // Check if the app was opened from a terminated state by tapping on a notification
//       FirebaseMessaging.instance.getInitialMessage().then((message) {
//         if (message != null) {
//           // Handle the message
//           // Navigate to a specific screen
//           if (kDebugMode) {
//             print('App opened from terminated state: ${message.notification?.title}');
//           }
//         }
//       });
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error: ${e.toString()}');
//       }
//     }
//   }
// }
