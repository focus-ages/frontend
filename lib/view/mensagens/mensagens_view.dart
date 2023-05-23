import 'package:flutter/material.dart';
import 'package:front/entity/phrase.dart';
import 'package:front/model/user_model.dart';
import '../../components/home_componenets/card_frases/floating.dart';
import '../../components/mensagens_personalizadas/add_text.dart';
import '../../components/mensagens_personalizadas/text_display.dart';
import '../../entity/user.dart';
import '../../resources/color_pattern.dart';
import '../../resources/text_styles.dart';

class Mensagens extends StatefulWidget {
  const Mensagens({Key? key}) : super(key: key);

  @override
  State<Mensagens> createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {
  final User_model userModel = User_model();

  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  @override
  Widget build(BuildContext context) {
    User user = userModel.getUser();
    List<Phrase> frases = user.phrases!;
    if (frases.length == 0) {
      frases.add(Phrase(text: "Desliga o celular e expanda sua força!"));
    }
    List<TextDisplay> messagesList =
        frases.map((frase) => TextDisplay(message: frase.text, onDelete: userModel.deletarFrase,)).toList();
    return Scaffold(
      backgroundColor: ColorPattern.darkMode,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 0,
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Text(
                  'Frases',
                  style: CustomTextStylesBuilder()
                        .withColor(ColorPattern.white)
                        .header2(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    child: FloatingButton(
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (context) => AddText( 
                            onSave: userModel.adicionarFrase,
                            placeholder: 'Escreva sua frase',
                          ),
                        )
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: ColorPattern.green,
                        size: displayWidth(context) * 0.075,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 30)),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: messagesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: messagesList[index],
                        ),
                       const SizedBox(height: 10),
                    ]);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
