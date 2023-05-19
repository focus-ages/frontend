import 'package:flutter/material.dart';
import '../../model/user_model.dart';
import '../../resources/color_pattern.dart';

class DeleteText extends StatefulWidget {
  final String message;
  final Function(String) onSave;
  final String placeholder;

  DeleteText({Key? key, required this.message, required this.onSave, required this.placeholder})
   : super(key: key);




  @override
  _DeleteTextState createState() => _DeleteTextState();
}

class _DeleteTextState extends State<DeleteText> {
  final User_model userModel = User_model();
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _messageFocusNode = FocusNode();
  final bool _showPlaceholder = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorPattern.darkCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Text("${widget.placeholder}",
          style: TextStyle(
            color: ColorPattern.white,
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            widget.onSave(this.widget.message),
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
