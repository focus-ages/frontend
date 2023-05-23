import 'package:flutter/material.dart';
import 'package:front/resources/color_pattern.dart';
import 'package:front/resources/text_styles.dart';

class LogoFocus extends StatelessWidget {
  const LogoFocus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorPattern.darkCard,
      ),
      height: 50,
      width: 320,
      child: Text("Let's Focus!",
          style: CustomTextStylesBuilder()
              .withColor(ColorPattern.white)
              .header1()),
    );
  }
}
