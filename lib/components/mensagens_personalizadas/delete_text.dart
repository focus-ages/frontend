  import 'package:flutter/material.dart';
  import 'package:flutter/rendering.dart';
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
Size size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      final double fontSize = constraints.maxWidth * 0.05;
      final TextStyle textStyle = TextStyle(
        color: ColorPattern.white,
        fontSize: fontSize,
      );

      return AlertDialog(
        backgroundColor: ColorPattern.darkCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 32.0),
          content: Text(
            widget.placeholder,
            style: textStyle,
          ),
        actions: <Widget>[
          TextButton(
            onPressed: () => {
              widget.onDelete(this.widget.message),
              Navigator.pop(context),
            },
            child: Text("Sim",
                style: TextStyle(
                  color: ColorPattern.white,
                  fontSize: size.width * 0.05,
                )),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Não",
                style: TextStyle(
                  color: ColorPattern.green,
                  fontSize: size.width * 0.05,
                )),
          ),
        ],
      );
    });
  }
}