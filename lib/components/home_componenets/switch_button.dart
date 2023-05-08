import 'package:flutter/material.dart';

import '../../resources/color_pattern.dart';

class CustomSwitcher extends StatefulWidget {
  const CustomSwitcher({Key? key}) : super(key: key);

  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final switchWidth = constraints.maxWidth *
            0.5; // ajuste a largura do switch de acordo com a largura da tela

        return Transform.scale(
          scale: switchWidth /
              50, // ajuste o tamanho do switch de acordo com a largura definida anteriormente
          child: Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            inactiveTrackColor: ColorPattern.gray,
            inactiveThumbColor: ColorPattern.white,
            activeTrackColor: ColorPattern.green,
            activeColor: ColorPattern.white,
          ),
        );
      },
    );
  }
}
