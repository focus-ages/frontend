import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:front/firebase_options.dart';
import 'package:front/view/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';

  FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  AndroidInitializationSettings androidSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  DarwinInitializationSettings iosSettings =
    const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true
    );

  InitializationSettings initializationSettings =
    InitializationSettings(
      android: androidSettings,
      iOS: iosSettings
    );

  bool? initialized =  await notificationsPlugin.initialize(
      initializationSettings
  );

  log("Notification: $initialized");

  await Firebase.initializeApp(options: 
  DefaultFirebaseOptions.currentPlatform);
  runApp(const AppWidget());

}



