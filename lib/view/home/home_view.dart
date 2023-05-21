// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:front/components/home_componenets/card_frases/card_frases.dart';
import 'package:front/components/home_componenets/countdown_timer.dart';
import 'package:front/components/home_componenets/switch_button.dart';
import 'package:front/model/user_model.dart';
import '../../model/screen_time_model.dart';
// teste
import '../../components/home_componenets/card_frases/floating.dart';
import '../../components/home_componenets/notification_button.dart';
import '../../components/mensagens_personalizadas/add_text.dart';
import '../../entity/user.dart';
import '../../resources/color_pattern.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User_model userModel = User_model();
  final CountDownController countDownController = CountDownController();
  final ScreenTimeModel screenTimeModel = ScreenTimeModel();

  @override
  Widget build(BuildContext context) {
    screenTimeModel.collectScreenData(countDownController);

    Size size = MediaQuery.of(context).size;

    User user = userModel.getUser();

    Size displaySize(BuildContext context) {
      return MediaQuery.of(context).size;
    }

    double displayWidth(BuildContext context) {
      return displaySize(context).width;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPattern.darkMode,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: prefer_const_constructors
          Padding(padding: EdgeInsets.only(bottom: size.height * 0.040)),

          Row(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      size.width * 0.1, 0, 0, size.height * 0.1)),
              Flexible(
                child: SafeArea(
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: displayWidth(context) * 0.08,
                              fontWeight: FontWeight.bold),
                          children: [
                        const TextSpan(
                            text: 'Olá, ',
                            style: TextStyle(color: ColorPattern.white)),
                        TextSpan(
                            text: user.name! + "👋",
                            style: TextStyle(color: ColorPattern.green))
                      ])),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),

          Center(
              child: Column(
            children: [
              CountdownTimer(duration: user.dailyGoal!,controller: countDownController,),
              SizedBox(
                height: size.height * 0.025,
              ),
              Text('Tempo Usado',
                  style: TextStyle(
                    color: ColorPattern.white,
                    fontSize: displayWidth(context) * 0.05,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextButton(
                        onPressed: () => {
                              showDialog(
                                context: context,
                                builder: (context) => AddText(
                                  onSave: userModel.changeDailyGoal,
                                  placeholder: 'Escreva sua nova meta diária',
                                ),
                              )
                            },
                        child: RichText(
                          text: TextSpan(
                              text: 'Meta Diária ',
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.04,
                                  color: const Color(0x30E3E3E3)),
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.create_outlined,
                                    color: const Color(0x30E3E3E3),
                                    size: displayWidth(context) * 0.04,
                                  ),
                                ),
                              ]),
                        )),
                  )
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
                  children: [
                    Flexible(
                      child: Text(
                        'Modo Focus',
                        style: TextStyle(
                          color: ColorPattern.white,
                          fontSize: displayWidth(context) * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.4),
                    ),
                    const Flexible(child: CustomSwitcher()),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: size.height * 0.005)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        'Barra de\nProgresso',
                        style: TextStyle(
                          color: ColorPattern.white,
                          fontSize: displayWidth(context) * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.423),
                    ),
                    const Flexible(child: CustomSwitcher()),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: size.height * 0.005)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "Tempo de \nNotificação",
                        style: TextStyle(
                          fontSize: displayWidth(context) * 0.05,
                          fontWeight: FontWeight.bold,
                          color: ColorPattern.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.35),
                    ),
                    // ignore: prefer_const_constructors
                    Flexible(
                        child: NotificationButton(min: user.notificationTime!)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: size.height * 0.005)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "Objetivos",
                        style: TextStyle(
                          fontSize: displayWidth(context) * 0.048,
                          fontWeight: FontWeight.bold,
                          color: ColorPattern.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.48),
                    ),
                    Flexible(
                      child: FloatingButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/objetivos');
                        },
                        icon: Icon(
                          Icons.add_task,
                          color: ColorPattern.green,
                          size: displayWidth(context) * 0.075,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(child: CardFrases(
            onTap: () {
              Navigator.pushNamed(context, '/mensagens');
            },
          )),
        ],
      ),
    );
  }
}
