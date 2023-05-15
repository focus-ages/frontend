import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/home_componenets/custom_button.dart';
import '../../resources/color_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BancoPage extends StatefulWidget {
  const BancoPage({Key? key}) : super(key: key);

  @override
  State<BancoPage> createState() => _BancoPage();
}

void testeCinza() async {}

class _BancoPage extends State<BancoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GrayScale App'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Ativar Escala de Cinza'),
            onPressed: () {
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  systemNavigationBarColor: Colors.black,
                  systemNavigationBarIconBrightness: Brightness.light,
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light,
                ),
              );
              SystemChrome.setEnabledSystemUIOverlays([]);
            },
          ),
        ),
      ),
    );
  }
}
