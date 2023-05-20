import 'package:flutter/material.dart';

import '../../../resources/color_pattern.dart';

class FloatingButton extends StatefulWidget {
  final Color color;
  final Icon icon;
  final Function() onPressed;
  const FloatingButton(
      {Key? key,
      this.color = ColorPattern.darkCard,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      color: widget.color,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: size.width * 0.08,
          height: size.height * 0.035,
          //color: widget.color,
          alignment: Alignment.center,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: widget.icon,
        ),
      ),
    );
  }
}
