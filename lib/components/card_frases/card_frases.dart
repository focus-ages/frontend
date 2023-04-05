import 'package:flutter/material.dart';
import 'package:front/components/card_frases/floating.dart';
import 'package:front/resources/color_pattern.dart';

class CardFrases extends StatefulWidget {
  const CardFrases({Key? key}) : super(key: key);

  @override
  State<CardFrases> createState() => _CardFrasesState();
}

class _CardFrasesState extends State<CardFrases> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      color: ColorPattern.darkCard,
      margin: const EdgeInsets.all(30),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mensagens Personalizadas",
              style: TextStyle(
                  color: ColorPattern.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(7)),
            const Text(
              "O uso do celular sem equilíbrio e disciplina, \n faz dele o maior ladrão do seu bem mais precioso,\n o seu tempo.",
              style: TextStyle(
                  color: ColorPattern.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:<Widget> [
                FloatingButton(
                  onPressed: () {}
                  ),
                ],
            ),
          ],
        ),
      ),
    );
  }
}
