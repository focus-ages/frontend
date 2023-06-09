import 'package:flutter/material.dart';

import '../../resources/color_pattern.dart';

class CustomButton extends StatefulWidget {
  final Widget title;
  final Color color;
  final Function() onPressed;
  const CustomButton(
      {Key? key,
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
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 5,
          //color: widget.color,
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
          child: widget.title,
        ),
      ),
    );
  }
}
