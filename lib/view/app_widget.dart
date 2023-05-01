import 'package:flutter/material.dart';
import 'package:front/view/cadastro/form_view.dart';
import 'package:front/view/home/home_view.dart';
import 'package:front/view/mensagens/mensagens_view.dart';


class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home':(context) => const HomePage(),
        '/cadastro':(context) => const Cadastro(),
        '/mensagens':(context) => const Mensagens(),
      },
    );
  }
}
