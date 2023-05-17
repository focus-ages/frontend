import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:front/firebase_options.dart';
import 'package:front/resources/notification/local_notification.dart';
import 'package:front/view/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';

  FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: 
  DefaultFirebaseOptions.currentPlatform);
  notification();
  runApp(const AppWidget());

}



