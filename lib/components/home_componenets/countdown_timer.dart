import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../../resources/color_pattern.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key, required this.duration}) : super(key: key);

  final int duration;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int currentDuration = 0;
  @override
  Widget build(BuildContext context) {
    int _duration = widget.duration;
    Size size = MediaQuery.of(context).size;

    Size displaySize(BuildContext context) {
      return MediaQuery.of(context).size;
    }

    double displayWidth(BuildContext context) {
      return displaySize(context).width;
    }

    return Stack(alignment: Alignment.center, children: [
      CircularCountDownTimer(
        width: size.width * 0.5,
        height: size.height * 0.2,
        duration: _duration,
        fillColor: ColorPattern.green,
        ringColor: ColorPattern.darkCard,
        strokeCap: StrokeCap.round,
        strokeWidth: 14.0,
        isTimerTextShown: true,
        textStyle: TextStyle(
          fontSize: displayWidth(context) * 0.07,
          color: ColorPattern.white,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Text("$_duration",
            style: TextStyle(
              fontSize: displayWidth(context) * 0.055,
              color: const Color(0x30E3E3E3),
            )),
      ),
    ]);
  }
}
