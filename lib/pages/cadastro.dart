import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../resources/color_pattern.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  static const customizedGreen = ColorPattern.green;

  /*void navigateToNextScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RoutinePeriodSelection()));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPattern.darkMode,
        centerTitle: true,
        title: Text('Focus',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 36)),
      ),
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'A Rotina Merece\n Ser Cuidada',
              //decoration: ,
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Notar e Anotar ajuda a cuidar da rotina de sua família Ensine desde cedo as crianças',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              //decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Organize Sua Rotina',
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Programe a semana!\nEvite imprevistos e confusões em sua casa \nValorize seu tempo!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Valorize cada conquista \nde seu filho!',
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Reconheça e elogie! \nEstimule seu filho nas tarefas do dia a dia',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              decoration: getPageDecoration(),
            )
          ],
          done: Text(
            'PRONTO',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: customizedGreen,
                fontSize: 15),
          ),
          onDone: () => "", //goToLogin(context),
          showSkipButton: true,
          skip: Text(
            'Pular',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: customizedGreen,
                fontSize: 15),
          ),
          next: Row(
            children: [
              Text(
                'Próximo',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: customizedGreen,
                    fontSize: 15),
              ),
              Icon(
                Icons.chevron_right_outlined,
                color: customizedGreen,
              ),
            ],
          ),
          dotsDecorator: getDotDecorator(),
          onChange: (index) => print('page $index selected'),
          globalBackgroundColor: ColorPattern.darkMode),
    );
  }

  DotsDecorator getDotDecorator() => DotsDecorator(
        color: Colors.white,
        size: Size(10, 10),
        activeSize: Size(15, 15),
        activeColor: customizedGreen,
      );

  /*void goToLogin(context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginPage()));

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 500));*/

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: customizedGreen),
        bodyTextStyle: TextStyle(fontSize: 20),
        titlePadding: EdgeInsets.all(8).copyWith(top: 0),
        //descriptionPadding: EdgeInsets.all(8).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(8),
        pageColor: Colors.white,
      );
}
