// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:front/components/cadastro/input_text.dart';
import 'package:front/components/cadastro/logo_text.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../entity/user.dart';
import '../../model/cadastro_model.dart';
import '../../model/user_model.dart';
import '../../resources/color_pattern.dart';
import 'package:front/validators/number_validator.dart';
import 'package:front/validators/name_validator.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final User_model userModel = User_model();
  final CadastroModel cadastroModel = CadastroModel();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _notificationTime = TextEditingController();
  final TextEditingController _dailyGoal = TextEditingController();
  int numberPage = 0;

  void register() async {
    User userFromForms = User(
      name: _name.text,
      notificationTime: int.parse(_notificationTime.text) * 60,
      dailyGoal: int.parse(_dailyGoal.text) * 3600,
      objectives: [],
      phrases: [],
    );
    await userModel.createUser(userFromForms);
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Size displaySize(BuildContext context) {
      return MediaQuery.of(context).size;
    }

    double displayWidth(BuildContext context) {
      return displaySize(context).width;
    }

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
                        Text(
                          'Olá, qual seu nome?',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorPattern.white,
                              fontSize: displayWidth(context) * 0.08),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 4)),
                        InputText(
                          controller: _name,
                        ),
                      ]),
                ],
              ),
              decoration: cadastroModel.getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const LogoFocus(),
                  const SizedBox(height: 145),
                  Text(
                    ' Devo lhe lembrar de\n sair do celular após \n quantos minutos? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorPattern.white,
                        fontSize: displayWidth(context) * 0.08),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4)),
                  InputText(
                    controller: _notificationTime,
                  ),
                ],
              ),
              decoration: cadastroModel.getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const LogoFocus(),
                  const SizedBox(height: 145),
                  Text(
                    ' Qual a sua meta diária\n ideal para passar no\n celular em horas? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorPattern.white,
                        fontSize: displayWidth(context) * 0.08),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 4)),
                  InputText(
                    controller: _dailyGoal,
                  ),
                ],
              ),
              decoration: cadastroModel.getPageDecoration(),
            )
          ],
          done: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorPattern.darkMode),
            //onPressed: register,
            onPressed: () => {
              if (NumberValidator.validateDailyGoal(_dailyGoal.text) == null &&
                  NumberValidator.validateNotificationTime(
                          _notificationTime.text) ==
                      null &&
                  NameValidator.nameValidator(_name.text) == null)
                {
                  register(),
                }
            },
            child: Text(
              'PRONTO',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorPattern.green,
                  fontSize: displayWidth(context) * 0.04),
            ),
          ),
          onDone: () => "",
          onChange: (value) {
            setState(() {
              numberPage = value;
            });
          },
          globalFooter: Column(
            children: [
              Text(
                cadastroModel.getCurrentText(numberPage),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorPattern.green,
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
                color: ColorPattern.green,
              ),
            ],
          ),
          showNextButton: true,
          next: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(
                Icons.chevron_right_outlined,
                size: 40,
                color: ColorPattern.green,
              ),
            ],
          ),
          dotsDecorator: cadastroModel.getDotDecorator(),
          globalBackgroundColor: ColorPattern.darkMode),
    );
  }
}
