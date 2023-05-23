import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:front/main.dart';

class NotificationModel {
  void showNotification() async {
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

    await notificationsPlugin.show(
        0, 'Notification Test', "Notification Test_2", notDetails);
  }
}
