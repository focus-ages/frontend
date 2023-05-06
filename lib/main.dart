import 'package:flutter/material.dart';
import 'package:front/firebase_options.dart';
import 'package:front/view/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: 
  DefaultFirebaseOptions.currentPlatform);
  runApp(AppWidget());
}