import 'package:flutter/material.dart';
import 'package:front/entity/phrase.dart';
import 'package:front/model/user_model.dart';
import '../../components/home_componenets/card_frases/floating.dart';
import '../../components/mensagens_personalizadas/add_new_message.dart';
import '../../components/mensagens_personalizadas/message_display.dart';
import '../../entity/user.dart';
import '../../resources/color_pattern.dart';

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
    List<MessageDisplay> messagesList =
        frases.map((frase) => MessageDisplay(message: frase.text)).toList();
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Text(
                  'Frases',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
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
                          builder: (context) => AddNewMessage(
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
                  itemCount: messagesList.length * 2 - 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index.isOdd) {
                      return const SizedBox(height: 10);
                    }
                    final messageIndex = index ~/ 2;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: messagesList[messageIndex],
                    );
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
