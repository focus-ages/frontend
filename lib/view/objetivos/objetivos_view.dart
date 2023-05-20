import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/components/mensagens_personalizadas/add_text.dart';

import '../../components/home_componenets/card_frases/floating.dart';
import '../../components/mensagens_personalizadas/text_display.dart';
import '../../entity/objective.dart';
import '../../entity/user.dart';
import '../../model/user_model.dart';
import '../../resources/color_pattern.dart';

class Objetivos extends StatefulWidget {
  const Objetivos({Key? key}) : super(key: key);

  @override
  State<Objetivos> createState() => _ObjetivosState();
}

class _ObjetivosState extends State<Objetivos> {
  final User_model userModel = User_model();

  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  @override
  Widget build(BuildContext context) {
    User user = userModel.getUser();
    List<Objective> objectives = user.objectives!;
    if (objectives.length == 0) {
      objectives.add(Objective(name: "Estudar", phrases:[]));
    }
    List<TextDisplay> objectivesList = 
      objectives.map((objective) => TextDisplay(message: objective.name, onDelete: userModel.removeObjective,)).toList(); // display precisam criar
    return Scaffold(
      backgroundColor: ColorPattern.darkMode,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 0,
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Text(
                  'Objetivos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    child: FloatingButton(
                      onPressed: () => {
                         showDialog(
                          context: context,
                          builder: (context) => AddText( //função que precisam criar
                            onSave: userModel.addObjective, // mudar aqui 
                            placeholder: 'Escreva seu objetivo',
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
                  const Padding(padding: EdgeInsets.only(right: 30)),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: objectivesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: objectivesList[index],
                        ),
                       const SizedBox(height: 10),
                    ]);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
