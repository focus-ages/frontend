import 'package:flutter/material.dart';
import 'package:is_lock_screen/is_lock_screen.dart';
import 'package:pausable_timer/pausable_timer.dart';
import '../../components/home_componenets/custom_button.dart';
import '../../resources/color_pattern.dart';

int tempo = 60;

class Funciona with WidgetsBindingObserver {
 // State<Funciona> createState() => _FuncionaState();


//class _FuncionaState extends State<Funciona> with WidgetsBindingObserver {
  final timer = PausableTimer(Duration(seconds: tempo), () => {});
  

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
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
  }
}
