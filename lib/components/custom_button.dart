import 'package:flutter/material.dart';

import '../resources/color_pattern.dart';

class CustomButton extends StatefulWidget {
  final Widget title;
  final Color color;
  final Function() onPressed;
  const CustomButton(
    { Key? key,
    required this.title,
    this.color = ColorPattern.green,
    required this.onPressed})
    : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 200,
          height: 80,
          //color: widget.color,
          alignment: Alignment.center,
          child: widget.title,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}