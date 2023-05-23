import 'package:flutter/material.dart';
import 'package:front/firebase_options.dart';
import 'package:front/view/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:front/resources/notification/local_notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

 FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AppWidget());
  notification();
}
