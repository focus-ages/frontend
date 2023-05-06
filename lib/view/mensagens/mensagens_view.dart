import 'package:flutter/material.dart';
import '../../components/home_componenets/card_frases/floating.dart';
import '../../components/mensagens_personalizadas/message_display.dart';
import '../../resources/color_pattern.dart';

class Mensagens extends StatelessWidget {
  const Mensagens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const frases = ['bom dia', 'boa tarde', 'boa noite'];
    List<MessageDisplay> messagesList = frases.map((frase) => MessageDisplay(message: frase, id: 0)).toList();

    return Scaffold(
      backgroundColor: ColorPattern.darkMode,
      body: Column(
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
              FloatingButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: ColorPattern.darkCard, size: 20),
              ),
              const Padding(padding: EdgeInsets.only(right: 30)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messagesList.length,
              itemBuilder: (BuildContext context, int index) {
                return messagesList[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}