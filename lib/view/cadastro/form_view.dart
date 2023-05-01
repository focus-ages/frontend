import 'package:flutter/material.dart';
import 'package:front/components/cadastro/input_text.dart';
import 'package:front/components/cadastro/logo_text.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../resources/color_pattern.dart';



class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  

  

  //final String title;

  @override
  State<Cadastro> createState() => _CadastroState();
  
}

class _CadastroState extends State<Cadastro> {


  static const customizedGreen = ColorPattern.green;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  String nome = '';
  int minutosLembrete = 0;
  int tempoIdeal = 0;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String nome = nomeController.text;
      try {
        await firestore.collection('usuarios').add({
          'nome': nome,
          'minutosLembrete': minutosLembrete,
          'tempoIdeal': tempoIdeal,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cadastro realizado com sucesso!'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao realizar cadastro. Tente novamente mais tarde.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: '',
              //decoration: ,
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const LogoFocus(),
                  const SizedBox(height: 230),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Padding(padding: EdgeInsets.only(right: 10)),
                        Text(
                          'Olá,',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorPattern.white,
                              fontSize: 32),
                        ),
                        InputText(),
                       
                      ]

                      ),
                ],
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              bodyWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 145),
                  const Text(
                    'Após quantos\nminutos devo lhe\nlembrar de sair do\ncelular ? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorPattern.white,
                        fontSize: 36),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Padding(padding: EdgeInsets.only(right: 4)),
                        Text(
                          'Minutos:',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorPattern.white,
                              fontSize: 32),
                        ),
                        InputText(),
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
                  const SizedBox(height: 145),
                  const Text(
                    'Qual a sua meta\ndiária ideal para\npassar no celular ? ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorPattern.white,
                        fontSize: 36),
                  ),
                  Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Padding(padding: EdgeInsets.only(right: 24)),
                        Text(
                          'Tempo:',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorPattern.white,
                              fontSize: 32),
                        ),
                        InputText(),
                      ]),
                ],
              ),
              decoration: getPageDecoration(),
            )
          ],
          done: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorPattern.darkMode),
            onPressed: () {
              _submitForm();
              Navigator.pushNamed(context, '/home');
            },
            child: const Text(
              'PRONTO',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: customizedGreen,
                  fontSize: 15),
            ),
          ),
          onDone: () => "",
           //goToHome(context),
          globalFooter: const Text(
            'Não pare agora!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: customizedGreen,
                fontSize: 18),
          ),
          showBackButton: true,
          back: Row(
            children: const [
              Icon(
                Icons.chevron_left_outlined,
                color: customizedGreen,
              ),
              Text(
                'Voltar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: customizedGreen,
                    fontSize: 12),
              ),
            ],
          ),
          showNextButton: true,
          next: Row(
            children: const [
              Text(
                'Próximo',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: customizedGreen,
                    fontSize: 12),
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
