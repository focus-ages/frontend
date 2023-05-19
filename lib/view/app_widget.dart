import 'package:flutter/material.dart';
import 'package:front/view/cadastro/form_view.dart';
import 'package:front/view/home/home_view.dart';
import 'package:front/view/home/splash_screen_view.dart';
import 'package:front/view/mensagens/mensagens_view.dart';
import 'package:front/view/home/teste.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/teste',
      routes: {
        '/': (context) => const Splash(),
        '/teste':(context) => const BancoPage(),
        '/home': (context) => const HomePage(),
        '/cadastro': (context) => const Cadastro(),
        '/mensagens': (context) => const Mensagens(),
      },
    );
  }
}
