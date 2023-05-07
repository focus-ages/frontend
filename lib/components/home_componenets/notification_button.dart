import 'package:flutter/material.dart';
import 'package:front/validators/number_validator.dart';

import '../../resources/color_pattern.dart';

class NotificationButton extends StatefulWidget {
  NumberValidator numberValidator = NumberValidator();
  var popupC;

  NotificationButton({Key? key, this.popupC}) : super(key: key);

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  int minutos = 20;

  void edit() {
    String title = "";
    String time = "19219";

    if (widget.popupC == 1) {
      //title = "Tempo de notificações:";
      //time = minutos.toString() + " Minutos";
      if (NumberValidator.validateDailyGoal(time) == null)
        title = "aa";
      else
        title = "Horário inválid";
    } else {
      title = "Meta diária:";
      time = minutos.toString() + " Horas";
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
            backgroundColor: ColorPattern.darkCard,
            title: Text(
              title,
              style: const TextStyle(color: ColorPattern.white, fontSize: 16),
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
                  if (widget.popupC == 1) {
                    // chamar função na user_model update notification time e passa para parametro o minutos
                  } else {
                    // chamar função na user_model update daily goal e passa para parametro o minutos
                  }
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
