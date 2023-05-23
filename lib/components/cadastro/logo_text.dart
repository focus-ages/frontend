import 'package:flutter/material.dart';
import 'package:front/resources/color_pattern.dart';

class LogoFocus extends StatelessWidget {
  const LogoFocus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Size displaySize(BuildContext context) {
      return MediaQuery.of(context).size;
    }

    double displayWidth(BuildContext context) {
      return displaySize(context).width;
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorPattern.darkCard,
      ),
      height: size.height * 0.065,
      width: displayWidth(context) * 0.75,
      child: Text("Let's Focus!",
          style: TextStyle(
              color: ColorPattern.white,
              fontSize: displayWidth(context) * 0.09,
              fontWeight: FontWeight.bold)),
    );
  }
}
