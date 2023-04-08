import 'package:flutter/material.dart';

import '../../resources/color_pattern.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  int minutos = 0;

  void edit() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: ColorPattern.darkCard,
            title: const Text('Editar Tempo',
                style: TextStyle(color: ColorPattern.white)),
            content: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Digite o tempo em minutos',
                hintStyle: TextStyle(color: ColorPattern.white)
              ),
              onChanged: (String value) {
                setState(() {
                  minutos = int.parse(value);
                });
              },
              
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar',
                    style: TextStyle(color: ColorPattern.green)
                    ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Salvar',
                    style: TextStyle(color: ColorPattern.green)),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String minutosString = minutos.toString();

    return TextButton(
        onPressed: () {
          edit();
        },
        child: Row(children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: minutosString,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    )),
                const TextSpan(
                    text: ' Min',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 3)),
          const Icon(Icons.edit, color: ColorPattern.white, size: 18),
        ]));
  }
}
