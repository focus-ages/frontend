import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:front/pages/cadastro.dart';
import 'package:front/resources/color_pattern.dart';
import 'view/app_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'Focus',
      //theme: ColorPattern.darkMode,
      home: Cadastro(title: 'Cadastro'),
      debugShowCheckedModeBanner: false,
    );
  }
}
