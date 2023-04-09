import 'package:flutter/material.dart';
import 'package:front/view/home/home_view.dart';

import 'start/start_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/home':(context) => const HomePage(),
      },
    );
  }
}


  
