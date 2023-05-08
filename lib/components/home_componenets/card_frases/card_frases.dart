import 'package:flutter/material.dart';
import 'package:front/components/home_componenets/card_frases/floating.dart';
import 'package:front/model/user_model.dart';
import 'package:front/resources/color_pattern.dart';

import '../../mensagens_personalizadas/add_new_message.dart';

class CardFrases extends StatefulWidget {
  const CardFrases({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;
  @override
  State<CardFrases> createState() => _CardFrasesState();
}

class _CardFrasesState extends State<CardFrases> {
  final User_model userModel = User_model();
  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 10,
        color: ColorPattern.darkCard,
        margin: const EdgeInsets.all(30),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      'Frases',
                      style: TextStyle(
                          color: ColorPattern.white,
                          fontSize: displayWidth(context) * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: FloatingButton(
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (context) => AddNewMessage(
                            onSave: userModel.adicionarFrase,
                            placeholder: 'Escreva sua frase',
                          ),
                        )
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: ColorPattern.green,
                        size: displayWidth(context) * 0.075,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(7)),
              Flexible(
                child: Text(
                  "Ok, 15 min have passed. Let´s work. \n Your dreams are dying.\n As your focus app, I´m truly disapointed",
                  style: TextStyle(
                      color: ColorPattern.white,
                      fontSize: displayWidth(context) * 0.04,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
