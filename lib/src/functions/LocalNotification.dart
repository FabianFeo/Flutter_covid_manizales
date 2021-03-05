// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
import 'package:aprendiendo/src/view/CodigoSeguridad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notification {
  BuildContext context;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Notification(this.context);
  initNotification() {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    FlutterLocalNotificationsPlugin().initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future<void> onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(seconds: 5));
    var android = new AndroidNotificationDetails(
      id.toString(),
      title,
      body,
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);

    await flutterLocalNotificationsPlugin.schedule(
        id, title, body, scheduledNotificationDateTime, platform);
  }
}
