import 'dart:async';
import 'package:screen_state/screen_state.dart';
import 'package:pausable_timer/pausable_timer.dart';

int tempo = 60;
final timer = PausableTimer(Duration(seconds: tempo), () => {resetTimer()});
void collectScreenData() async {

  late StreamSubscription<ScreenStateEvent> _subscription;
  Screen _screen = Screen();
  _subscription = _screen.screenStateStream!.listen((ScreenStateEvent event) {
    if (event == ScreenStateEvent.SCREEN_ON) {
      if (!timer.isActive) {
        timer.start();
        print('tela on ----------');
      }
    } else if (event == ScreenStateEvent.SCREEN_OFF) {
        print('tela off ---------- ${timer.elapsed}');
        timer.reset();
        timer.pause();
    }
  });
}

void resetTimer() {
  print('ficou o tempo todo ----------');
  timer.reset();
  timer.start();
}
