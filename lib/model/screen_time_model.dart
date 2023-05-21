import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:screen_state/screen_state.dart';
import 'user_model.dart';
import '../controller/user_controller.dart';
import 'package:pausable_timer/pausable_timer.dart';

PausableTimer timer =
    PausableTimer(Duration(seconds: (getNotificationTime())), resetTimer);
PausableTimer dailyGoal =
    PausableTimer(Duration(seconds: (getDailyGoal())), activateGreyScale);
PausableTimer halfedDailyGoal = PausableTimer(
    Duration(seconds: ((getDailyGoal() / 2).round())), activateGreyScale);
//criar um timer para gray scale 50% e notifactiontime

final User_model user_model = User_model();
final UserController userController = UserController();

class ScreenTimeModel {
  static final ScreenTimeModel screenTimeModel = ScreenTimeModel._internal();

  factory ScreenTimeModel() {
    return screenTimeModel;
  }

  ScreenTimeModel._internal();

  void collectScreenData(CountDownController timerController) async {
    timerController.start();
    timer.start();
    dailyGoal.start();
    halfedDailyGoal.start();
    late StreamSubscription<ScreenStateEvent> _subscription;
    Screen _screen = Screen();
    _subscription = _screen.screenStateStream!.listen((ScreenStateEvent event) {
      print('Screen is $event');
      print("tempo usado: " + timer.elapsed.inSeconds.toString());
      print("tempo restante: " +
          (getNotificationTime() - getTimeUsed()!).toString());
      print('tempo total: ' + getNotificationTime().toString());
      print('timer tempo total:' + timer.duration.inSeconds.toString());

      if (event == ScreenStateEvent.SCREEN_UNLOCKED) {
        if (!timer.isActive) {
          timerController.resume();
          timer.start();
          dailyGoal.start();
          halfedDailyGoal.start();
        }
      } else if (event == ScreenStateEvent.SCREEN_OFF) {
        timerController.pause();
        updateTimeUsed(timer.elapsed.inSeconds);
        int t = timer.elapsed.inSeconds;
        int aux = ((timer.duration.inSeconds) - t);
        timer.cancel();
        timer = PausableTimer(Duration(seconds: aux), () => {resetTimer()});
        //timer.reset();
        timer.pause();
        dailyGoal.pause();
        halfedDailyGoal.pause();
      }
      //envia para o banco o tempo usado em segundos
      //TO-DO: DESTROIR O TIMER antigo e criar um novo com o notificationTime - o timer.elapsed.inSeconds para que
      // o timer fique correto
    });
  }
}

//VOU RETIRAR DAQUI E COLOCAR NO USER_CONTROLLER
Future<void> updateTimeUsed(int seg) async {
  userController.findUser(user_model.userId).then(
      (user) => {userController.updateTimeElapsed(user_model.userId, seg)});
}

void resetTimer() {
  //caso o usuario fique o tempo todo com a tela ligada, o timer reseta e envia para o banco
  updateTimeUsed(timer.elapsed.inSeconds);
  print('resetou o timer');
  if (timer.duration != getNotificationTime()) {
    print('timer duration: ' + timer.duration.inSeconds.toString());
    timer = PausableTimer(
        Duration(seconds: (getNotificationTime())), () => {resetTimer()});
  }
  //aqui vai a chamada do metodo que cria e envia a notificação
  timer.reset();
  timer.start();
}

void activateGreyScale() {
  print('chegou no daily goal');
  //TO-DO: Função q ativa o greyscale
}

int? getTimeUsed() {
  return user_model.getUser().timeUsed;
}

int getNotificationTime() {
  return (user_model.getUser().notificationTime)!; // *60
}

int getDailyGoal() {
  return user_model.getUser().dailyGoal!; //*3600
}
