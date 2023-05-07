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
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 0,
            child: IconButton(
              onPressed:() => Navigator.pushNamed(context, '/home'),
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 30,),
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
                  FloatingButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_rounded, color: ColorPattern.darkCard, size: 25),
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