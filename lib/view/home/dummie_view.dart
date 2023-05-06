import 'package:flutter/material.dart';
import 'package:front/model/user_model.dart';
import '../../components/home_componenets/card_frases/floating.dart';
import '../../resources/color_pattern.dart';

class MessageDeleteDialog extends StatelessWidget {
  final int id;
  const MessageDeleteDialog({Key? key, required this.id}) : super(key: key);


@override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorPattern.darkCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: const Text("Deseja mesmo deletar a frase?",
          style: TextStyle(
            color: ColorPattern.white,
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
          //deletarFrase(frase),
            
            Navigator.pop(context)
          },
          child: const Text("Sim",
              style: TextStyle(
                color: Colors.white10,
              )),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Não", style: TextStyle(color: ColorPattern.green)),
        ),
      ],
    );
  }
}



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
                onPressed: (

                ) {},  //adicionarFrase(),
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