import 'package:shared_preferences/shared_preferences.dart';

class NotificationSharedPreferences {
  static const String _keyNotification = 'notification';

  static Future<void> setNotification(bool notification) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyNotification, notification);
  }

  static Future<bool?> getNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyNotification);
  }
}
