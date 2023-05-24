import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import '../../resources/color_pattern.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer(
      {Key? key, required this.duration, required this.controller})
      : super(key: key);
  final int duration;
  final CountDownController controller;
  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int currentDuration = 0;

  @override
  Widget build(BuildContext context) {
    int _duration = widget.duration;
    String _durationFormated = (_duration ~/ 3600).toString() + " h";
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
        textFormat: CountdownTextFormat.HH_MM_SS,
        controller: widget.controller,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Text("$_durationFormated",
            style: TextStyle(
              fontSize: displayWidth(context) * 0.055,
              color: const Color(0x30E3E3E3),
            )),
      ),
    ]);
  }
}