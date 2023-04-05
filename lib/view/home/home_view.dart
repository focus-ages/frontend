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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Center(child: LogoFocus()),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(left: 45.0),
            child: const Text('Olá ______',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 36, color: Colors.white)),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80.0, bottom: 40.0, left: 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountdownTimer(),
                    Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
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
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 25.0)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Objetivos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                  Wrap(
                    direction: Axis.vertical,
                    runSpacing: 10,
                    spacing: 10,
                    children: <Widget>[
                      ObjectiveButton(
                        onPressed: () {},
                        title: const Text(
                          "Estudar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorPattern.darkMode,
                          ),
                        ),
                      ),
                      ObjectiveButton(
                        onPressed: () {},
                        title: const Text(
                          "Estudar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorPattern.darkMode,
                          ),
                        ),
                      ),
                      ObjectiveButton(
                        onPressed: () {},
                        title: const Text(
                          "Estudar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorPattern.darkMode,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),

          const Switchbutton('Linha Progressiva'),
          const Switchbutton('Greyscale'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                "10 Minutos",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
         const CardFrases(),
        ],
      ),
    );
  }
}
