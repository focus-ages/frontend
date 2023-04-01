import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../resources/color_pattern.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  final int _duration=10;
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      duration: _duration,
      fillColor: ColorPattern.green,
      ringColor: ColorPattern.darkCard,
      strokeCap: StrokeCap.round,
      strokeWidth: 25.0,
      isTimerTextShown: true,
      fillGradient: const LinearGradient(
            colors: [

              Color(0xff23B854),
              Color(0xff346B47),
              Color(0xff2DEB6C),
              Color(0xff75EE9D),
              Color(0xff27CC5D),]),

      textStyle: const TextStyle(
        fontSize: 36,
        color: Colors.white,
      ),
    );
  }
}
