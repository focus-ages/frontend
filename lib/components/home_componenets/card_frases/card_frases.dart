import 'package:flutter/material.dart';
import 'package:front/components/home_componenets/card_frases/floating.dart';
import 'package:front/model/user_model.dart';
import 'package:front/resources/color_pattern.dart';
import 'package:front/validators/text_validator.dart';

import '../../../resources/text_styles.dart';
import '../../mensagens_personalizadas/add_text.dart';

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
                      style: CustomTextStylesBuilder()
                          .withColor(ColorPattern.white)
                          .title1(),
                    ),
                  ),
                  Flexible(
                    child: FloatingButton(
                      onPressed: () => {
                        showDialog(
                          context: context,
                          builder: (context) => AddText(
                              onSave: userModel.adicionarFrase,
                              placeholder: 'Escreva sua frase',
                              validator: (String? v) {
                                if (v == null) return null;
                                return TextValidator.textValidator(v);
                              }),
                        ),
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
                  "Ok, 15 min have passed. Let´s work. \n\nYour dreams are dying.\n\nAs your focus app, I´m truly disapointed",
                  style: CustomTextStylesBuilder().cardFrases(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
