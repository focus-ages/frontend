import 'package:flutter/material.dart';
import '../../components/home_componenets/card_frases/floating.dart';
import '../../resources/color_pattern.dart';

class Mensagens extends StatefulWidget{
  const Mensagens({Key? key}) : super(key: key);

  @override
  State<Mensagens> createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens>{

  List<String> frases = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPattern.darkMode,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            child: Text('Frases',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24
              ),
            ),
          ),
          //const Padding(padding: EdgeInsets.fromLTRB(10, 10, 20, 20)),
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