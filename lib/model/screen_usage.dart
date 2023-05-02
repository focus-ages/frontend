import 'package:flutter/material.dart';
import 'package:is_lock_screen/is_lock_screen.dart';
import 'package:pausable_timer/pausable_timer.dart';

int tempo = 60;

void colectScreenData() {
  final timer = PausableTimer(Duration(seconds: tempo), () => {});

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    while (true) {
      if (timer.isExpired) {
        print('envia pro db -ficou o tempo todo ---------- $timer.elapsed');
        timer.reset();
      } else if (timer.isActive && await isLockScreen() == true) {
        print('envia pro db- terminou antes -------------- $timer.elapsed');
        timer.reset();
        timer.pause();
      } else if (await isLockScreen() == false) {
        await Future<void>.delayed(const Duration(seconds: 1));
        print(timer.elapsed);
        if (!timer.isActive) {
          timer.start();
        }
      }
    }
  });
}
