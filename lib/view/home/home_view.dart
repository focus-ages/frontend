// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:front/components/home_componenets/card_frases/card_frases.dart';
import 'package:front/components/home_componenets/countdown_timer.dart';
import 'package:front/components/home_componenets/switch_button.dart';

import '../../components/home_componenets/card_frases/floating.dart';
import '../../components/home_componenets/notification_button.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPattern.darkMode,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(left: 45.0, top: 80),
            child: const Text('Olá, Lucas \u{1F44B}',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25, color: ColorPattern.white)),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 40)),
          Center(
              child: Column(
            children: [
              const CountdownTimer(),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              const Text('Tempo Usado',
                  style: TextStyle(
                    color: ColorPattern.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 5)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Meta Diária',
                        style: TextStyle(
                          color: ColorPattern.gray,
                          fontSize: 18,
                        )),
                  ),
                  const Icon(Icons.edit, color: ColorPattern.gray, size: 18),
                ],
              ),
            ],
          )),
          Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Barra de progresso',
                        style: TextStyle(
                          color: ColorPattern.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 5)),

                      CustomSwitcher(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'GrayScale',
                        style: TextStyle(
                          color: ColorPattern.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 65)),
                      CustomSwitcher(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Tempo de \nNotificação",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: ColorPattern.white,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 60)),
                      // ignore: prefer_const_constructors
                      NotificationButton(),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Objetivos",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: ColorPattern.white,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 82)),
                      FloatingButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_task,
                            color: ColorPattern.darkCard, size: 15),
                      ),
                    ],
                  ),
                ],
              )),

          const CardFrases(),
        ],
      ),
    );
  }
}
