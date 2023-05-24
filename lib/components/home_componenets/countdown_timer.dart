import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:front/resources/text_styles.dart';

import '../../model/screen_time_model.dart';
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
          textStyle:
              CustomTextStylesBuilder().timer(displayWidth(context) * 0.07)),
      Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Text("$_duration",
            style: CustomTextStylesBuilder()
                .endTimer(displayWidth(context) * 0.055)),
      ),
    ]);
  }
}
