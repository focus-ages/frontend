import 'package:flutter/material.dart';
import 'package:front/resources/text_styles.dart';
import '../../model/user_model.dart';
import '../../resources/color_pattern.dart';

class DeleteText extends StatefulWidget {
  final String message;
  final Function(String) onDelete;
  final String placeholder;

  DeleteText(
      {Key? key,
      required this.message,
      required this.onDelete,
      required this.placeholder})
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
          style:
              CustomTextStylesBuilder().withColor(ColorPattern.white).title1()),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            widget.onDelete(this.widget.message),
            Navigator.pop(context),
          },
          child:
              Text("Sim", style: CustomTextStylesBuilder().whitePopUpButton()),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Não", style: CustomTextStylesBuilder().greenPopUpButton()),
        ),
      ],
    );
  }
}
