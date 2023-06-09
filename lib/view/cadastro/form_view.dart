// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:front/components/cadastro/input_text.dart';
import 'package:front/components/cadastro/logo_text.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../entity/user.dart';
import '../../model/user_model.dart';
import '../../resources/color_pattern.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  static const customizedGreen = ColorPattern.green;
  final User_model userModel = User_model();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _notificationTime = TextEditingController();
  final TextEditingController _dailyGoal = TextEditingController();

  void register() async {
    User userFromForms = User(
      name: _name.text,
      notificationTime: int.parse(_notificationTime.text),
      dailyGoal: int.parse(_dailyGoal.text),
      objectives: [],
      phrases: [],
    );
    await userModel.createUser(userFromForms);
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: '',
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const LogoFocus(),
                  const SizedBox(height: 230),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(padding: EdgeInsets.only(right: 10)),
                        const Text(
                          'Olá, qual seu nome?',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorPattern.white,
                              fontSize: 32),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 4)),
                        InputText(
                          controller: _name,
                        ),
                      ]),
                ],
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const LogoFocus(),
                  const SizedBox(height: 145),
                  const Text(
                    ' Após quantos minutos\n devo lhe lembrar de\n sair do celular? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorPattern.white,
                        fontSize: 32),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4)),
                  InputText(
                    controller: _notificationTime,
                    //placeholder: "digite aqui",
                  ),
                ],
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const LogoFocus(),
                  const SizedBox(height: 145),
                  const Text(
                    ' Qual a sua meta diária\n ideal para passar\n no celular? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorPattern.white,
                        fontSize: 32),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4)),
                  InputText(
                    controller: _dailyGoal,
                  ),
                ],
              ),
              decoration: getPageDecoration(),
            )
          ],
          done: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorPattern.darkMode),
            onPressed: register,
            child: const Text(
              'PRONTO',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: customizedGreen,
                  fontSize: 15),
            ),
          ),
          onDone: () => "",
          globalFooter: Column(
            children: const [
              Text(
                'Não pare agora!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: customizedGreen,
                    fontSize: 18),
              ),
              SizedBox(height: 20),
            ],
          ),
          showBackButton: true,
          back: Row(
            children: const [
              Icon(
                Icons.chevron_left_outlined,
                size: 40,
                color: customizedGreen,
              ),
              Text(
                'Voltar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: customizedGreen,
                    fontSize: 14),
              ),
            ],
          ),
          showNextButton: true,
          next: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Próximo',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: customizedGreen,
                    fontSize: 14),
              ),
              Icon(
                Icons.chevron_right_outlined,
                size: 40,
                color: customizedGreen,
              ),
            ],
          ),
          dotsDecorator: getDotDecorator(),
          globalBackgroundColor: ColorPattern.darkMode),
    );
  }

  DotsDecorator getDotDecorator() => const DotsDecorator(
        color: ColorPattern.white,
        size: Size(10, 10),
        activeSize: Size(15, 15),
        activeColor: customizedGreen,
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: customizedGreen),
        bodyTextStyle: const TextStyle(fontSize: 20),
        titlePadding: const EdgeInsets.all(8).copyWith(top: 0),
        //descriptionPadding: EdgeInsets.all(8).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(8),
      );
}
