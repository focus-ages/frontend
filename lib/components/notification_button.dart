import 'package:flutter/material.dart';

import '../resources/color_pattern.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({Key? key}) : super(key: key);

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Row(children: [
          
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: '10',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    )),
                TextSpan(
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
