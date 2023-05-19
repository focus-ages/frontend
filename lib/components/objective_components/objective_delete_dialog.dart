import 'package:flutter/material.dart';
import '../../model/user_model.dart';
import '../../resources/color_pattern.dart';


class ObjectiveDeleteDialog extends StatefulWidget {
  final String message;

  ObjectiveDeleteDialog({Key? key, required this.message}) : super(key: key);

  @override
  State<ObjectiveDeleteDialog> createState() => _ObjectiveDeleteDialogState();
}

class _ObjectiveDeleteDialogState extends State<ObjectiveDeleteDialog> {
  final User_model userModel = User_model();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorPattern.darkCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: const Text("Deseja mesmo deletar esse objetivo?",
          style: TextStyle(
            color: ColorPattern.white,
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            userModel.deletarFrase(this.widget.message),
            Navigator.pop(context),
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
