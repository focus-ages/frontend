import 'package:flutter/material.dart';

import '../resources/color_pattern.dart';

class CustomSwitcher extends StatefulWidget {
  const CustomSwitcher({Key? key}) : super(key: key);

  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      inactiveTrackColor: ColorPattern.darkCard,
      inactiveThumbColor: ColorPattern.darkCard,
      activeTrackColor: ColorPattern.green,
      activeColor: ColorPattern.green,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
    );
  }
}
