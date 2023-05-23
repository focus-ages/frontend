import 'package:flutter/material.dart';
import 'package:front/resources/text_styles.dart';
import '../../resources/color_pattern.dart';
import 'package:front/model/user_model.dart';
import 'delete_text.dart';

class TextDisplay extends StatelessWidget {
  final Function(String) onDelete;
  final String message;
  final int maxCharacters;
    Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
    double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }
      double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  const TextDisplay(
      {Key? key, required this.message, required this.onDelete, this.maxCharacters = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User_model userModel = User_model();
    final displayMessage = message.length > maxCharacters
        ? '"${message.substring(0, maxCharacters)}..."'
        : '"$message"';
    return Expanded(
      flex: 10,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.025, horizontal: displayWidth(context) * 0.025),
        decoration: BoxDecoration(
          color: ColorPattern.darkCard,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
             Expanded(
              flex: 17,
                child: Text(
                  displayMessage,
                  style: CustomTextStylesBuilder().listaFrases(displayWidth(context)*0.04),
                ),
              ),
    
            Expanded(
              flex: 3,
              child: IconButton(
                icon: Icon(Icons.delete_forever_rounded,
                    color: ColorPattern.green, size: displayWidth(context)*0.08),
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (context) => DeleteText(
                      message: message,
                      onDelete: onDelete, 
                      placeholder: 'Deseja mesmo deleter essa frase?',),
                  )
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
