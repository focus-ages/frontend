import 'package:flutter/material.dart';
import 'package:front/resources/text_styles.dart';

import '../../model/user_model.dart';
import '../../resources/color_pattern.dart';
import '../mensagens_personalizadas/add_text.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({Key? key, required this.min}) : super(key: key);

  final int min;

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  final User_model userModel = User_model();
  int minutos = 20;

  @override
  Widget build(BuildContext context) {
    minutos = widget.min;
    String minutosString = minutos.toString();
    Size size = MediaQuery.of(context).size;

    Size displaySize(BuildContext context) {
      debugPrint('Size = ' + MediaQuery.of(context).size.toString());
      return MediaQuery.of(context).size;
    }

    double displayWidth(BuildContext context) {
      debugPrint('Width = ' + displaySize(context).width.toString());
      return displaySize(context).width;
    }

    return TextButton(
        onPressed: () => {
              showDialog(
                context: context,
                builder: (context) => AddText(
                  onSave: userModel.changeNotificationTime,
                  placeholder: 'Escreva seu novo tempo de notificação',
                ),
              )
            },
        child: Row(children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: minutosString,
                    style: CustomTextStylesBuilder().notificationTimeNumber(displayWidth(context)* 0.05)
                  ),
                TextSpan(
                    text: ' min',
                    style: CustomTextStylesBuilder().notificationTimeText(displayWidth(context)* 0.05)
                  ),
              ],
            ),
          ),
          Flexible(
              child:
                  Padding(padding: EdgeInsets.only(left: size.width * 0.01))),
          Flexible(
            child: Icon(
              Icons.create_outlined,
              color: ColorPattern.white,
              size: displayWidth(context) * 0.05,
            ),
          ),
        ]));
  }
}
