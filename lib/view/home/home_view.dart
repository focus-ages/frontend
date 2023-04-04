import 'package:flutter/material.dart';
import 'package:front/components/countdown_timer.dart';
import 'package:front/components/logo_text.dart';
import 'package:front/components/switch_button.dart';

import '../../components/custom_button.dart';
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
          const Padding(padding: EdgeInsets.all(25.0)),
          const Center(child: LogoFocus()),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text('Olá ______',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 36, color: Colors.white)),
          ),
          Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CountdownTimer(),
              const Switchbutton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () {},
                    title: const Text(
                      "Alterar Metas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorPattern.darkMode,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(7.0)),
                  CustomButton(
                    onPressed: () {},
                    title: const Text(
                      "Frase Rápida",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorPattern.darkMode,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(7.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () {},
                    title: const Text(
                      "Objetivos",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorPattern.darkMode,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(7.0)),
                  CustomButton(
                    onPressed: () {},
                    title: const Text(
                      "Frases",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorPattern.darkMode,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}

