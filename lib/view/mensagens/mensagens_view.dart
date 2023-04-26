import 'package:flutter/material.dart';
import '../../components/home_componenets/card_frases/floating.dart';
import '../../resources/color_pattern.dart';

class Mensagens extends StatefulWidget{
  const Mensagens({Key? key}) : super(key: key);

  @override
  State<Mensagens> createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPattern.darkMode,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(156, 80, 156, 70),
            child: Text('Frases',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingButton(
                onPressed: () {},
                icon: const Icon(Icons.add,
                    color: ColorPattern.darkCard, size: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}