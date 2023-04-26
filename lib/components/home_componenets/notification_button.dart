import 'package:flutter/material.dart';

import '../../resources/color_pattern.dart';

class NotificationButton extends StatefulWidget {
  var popupC;

  NotificationButton({Key? key, this.popupC}) : super(key: key);

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  int minutos = 20;

  void edit() {
    String title = "";
    String time = "";

    if (widget.popupC == 1) {
      title = "Tempo de notificações:";
      time = minutos.toString() + " Minutos";
    } else {
      title = "Meta diária:";
      time = minutos.toString() + " Horas";
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: ColorPattern.darkCard,
            title: Text(
              title,
              style: const TextStyle(color: ColorPattern.white),
              textAlign: TextAlign.center,
            ),
            content: Container(
              width: 10,
              height: 55,
              decoration: BoxDecoration(
                  color: ColorPattern.whiteOpacity,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                textAlign: TextAlign.center,
                style: const TextStyle(color: ColorPattern.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: time,
                    hintStyle: const TextStyle(color: ColorPattern.gray)),
                onChanged: (String value) {
                  setState(() {
                    minutos = int.parse(value);
                  });
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar',
                    style: TextStyle(color: ColorPattern.green)),
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
                      color: ColorPattern.green,
                    )),
                const TextSpan(
                    text: ' min',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorPattern.white,
                    )),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 3)),
          const Icon(Icons.edit, color: ColorPattern.white, size: 18),
        ]));
  }
}
