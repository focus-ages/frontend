import 'package:flutter/material.dart';

import '../resources/color_pattern.dart';

class Switchbutton extends StatefulWidget {
  final String name;
  const Switchbutton(this.name, {key}) : super(key: key);

  @override
  State<Switchbutton> createState() => _SwitchbuttonState();
}

class _SwitchbuttonState extends State<Switchbutton> {
  bool _focus = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: SwitchListTile(
        activeTrackColor: ColorPattern.green,
        activeColor: ColorPattern.white,
        inactiveThumbColor: ColorPattern.darkCard,
        inactiveTrackColor: ColorPattern.darkCard,
        title: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        value: _focus,
        onChanged: (bool value) {
          setState(() {
            _focus = value;
          });
        },
      ),
    );
  }
}
