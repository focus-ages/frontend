import 'package:flutter/material.dart';
import 'package:front/components/card_frases/card_frases.dart';
import 'package:front/components/countdown_timer.dart';
import 'package:front/components/logo_text.dart';
import 'package:front/components/objective_button.dart';
import 'package:front/components/switch_button.dart';

import '../../resources/color_pattern.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPattern.darkMode,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(left: 45.0, top: 80),
            child: const Text('Olá ______',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          Center(
              child: Column(
            children: const [
              CountdownTimer(),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              Text('Tempo Usado',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Text('Meta Diária',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  )),
            ],
          )),

          const Switchbutton('Linha Progressiva'),
          const Switchbutton('Greyscale'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                "Tempo de Notificação",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "10 Min",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const CardFrases(),
        ],
      ),
    );
  }
}
