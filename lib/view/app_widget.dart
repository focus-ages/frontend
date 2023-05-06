import 'package:flutter/material.dart';
import 'package:front/model/splash_screen_model.dart';
import 'package:front/view/cadastro/form_view.dart';
import 'package:front/view/home/home_view.dart';
import 'package:localstorage/localstorage.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  final LocalStorage storage = LocalStorage('some_key');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      home: const Splash(),
      routes: {
        '/splash': (context) => const Splash(),
        '/cadastro': (context) => const Cadastro(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
