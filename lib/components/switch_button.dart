import 'package:flutter/material.dart';

import '../resources/color_pattern.dart';

class Switchbutton extends StatefulWidget {
  const Switchbutton({key});

  @override
  State<Switchbutton> createState() => _SwitchbuttonState();
}

class _SwitchbuttonState extends State<Switchbutton> {
  bool _focus = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: SwitchListTile(
        activeTrackColor: ColorPattern.green,
        activeColor: ColorPattern.white,
        inactiveThumbColor: ColorPattern.darkCard,
        inactiveTrackColor: ColorPattern.darkCard,

        title: const Text('Modo Focus',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
    
            )),
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
