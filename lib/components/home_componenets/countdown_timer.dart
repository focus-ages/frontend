import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import '../../resources/color_pattern.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  final int _duration = 10;
  int currentDuration = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      CircularCountDownTimer(
        //width: MediaQuery.of(context).size.width / 2,
        //height: MediaQuery.of(context).size.height / 2,
        width: 180,
        height: 180,
        duration: _duration,
        fillColor: ColorPattern.green,
        ringColor: ColorPattern.darkCard,
        strokeCap: StrokeCap.round,
        strokeWidth: 20.0,
        isTimerTextShown: true,
        fillGradient: const LinearGradient(colors: [
          Color(0xff23B854),
          Color(0xff346B47),
          Color(0xff2DEB6C),
          Color(0xff75EE9D),
          Color(0xff27CC5D),
        ]),
        //faz isso funcionar
        onChange: (String timeStamp) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              currentDuration = int.parse(timeStamp);
            });
          });
        },
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(currentDuration.toString() + " seg",
              style: const TextStyle(
                fontSize: 20,
                color: ColorPattern.white,
              )),
          Text(_duration.toString() + ":00",
              style: const TextStyle(
                fontSize: 16,
                color: ColorPattern.gray,
              )),
        ],
      ),
    ]);
  }
}
