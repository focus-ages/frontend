import 'package:flutter/material.dart';

import '../../resources/color_pattern.dart';

class FloatingButton extends StatefulWidget {
  
  final Color color;
  final Function() onPressed;
  const FloatingButton(
    { Key? key,
    
    this.color = ColorPattern.green,
    required this.onPressed})
    : super(key: key);

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
   return Material(
      color: widget.color,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 25,
          height: 25,
          //color: widget.color,
          alignment: Alignment.center,
          
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: const Icon(
            Icons.add,
            color: ColorPattern.darkCard,
            size: 15,

          ),
        ),
      ),
    );

  
  }
}
