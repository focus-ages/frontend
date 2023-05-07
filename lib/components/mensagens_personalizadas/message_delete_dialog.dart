import 'package:flutter/material.dart';
import '../../resources/color_pattern.dart';

class MessageDeleteDialog extends StatelessWidget {
  final String message;
  const MessageDeleteDialog({Key? key, required this.message})
      : super(key: key);

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
            //executa tarefa de deletar a frase
            //exemplo: deletaMensagem(message: message); //passando a mensagem
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
