import 'package:flutter/material.dart';
import '../../resources/color_pattern.dart';
import './message_delete_dialog.dart';

class MessageDisplay extends StatelessWidget {
  final String message;
  final int id;

  const MessageDisplay({Key? key, required this.message, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF252534),
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
              message,
              style: const TextStyle(
                  fontSize: 16.0, color: ColorPattern.white, height: 1.5),
            ),
          ),
          Expanded(
            flex: 3,
            child: IconButton(
              icon: const Icon(Icons.delete_forever_rounded,
                  color: ColorPattern.green, size: 30),
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) => MessageDeleteDialog(id: id),
                )
              },
            ),
          ),
        ],
      ),
    );
  }
}
