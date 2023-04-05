import 'package:flutter/material.dart';

import '../resources/color_pattern.dart';

class ObjectiveButton extends StatefulWidget {
  final Widget title;
  final Color color;
  final Function() onPressed;
  const ObjectiveButton(
    { Key? key,
    required this.title,
    this.color = ColorPattern.green,
    required this.onPressed})
    : super(key: key);

  @override
  State<ObjectiveButton> createState() => _ObjectiveButtonState();
}

class _ObjectiveButtonState extends State<ObjectiveButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: MediaQuery.of(context).size.width / 5,
          height: MediaQuery.of(context).size.width / 12,
          //color: widget.color,
          alignment: Alignment.center,
          child: widget.title,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}