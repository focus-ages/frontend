import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:front/main.dart';
import 'package:front/model/user_model.dart';
import 'package:front/resources/local_notification.dart';

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationModel {
  static final NotificationModel notificationModel =
      NotificationModel._internal();
  factory NotificationModel() {
    return notificationModel;
  }
  final User_model user_model = User_model();
  NotificationModel._internal();
  final LocalNotification localNotification = LocalNotification();

  void showNotification() async {
    localNotification.notification();
    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails("Notification - Focus", "Focus",
            priority: Priority.max, importance: Importance.max);

    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    String phrase = user_model.buscarFrase();
    await notificationsPlugin.show(0, 'Focus', phrase, notDetails);
  }
}
