import 'dart:async';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screen_state/screen_state.dart';
import 'user_model.dart';
import '../controller/user_controller.dart';
import 'package:pausable_timer/pausable_timer.dart';

class ScreenTimeModel {
  static final ScreenTimeModel screenTimeModel = ScreenTimeModel._internal();
  final User_model user_model = User_model();
  final UserController userController = UserController();
  int createdAt = Timestamp.now().toDate().day;

  factory ScreenTimeModel() {
    return screenTimeModel;
  }

  ScreenTimeModel._internal();

  void collectScreenData(CountDownController timerController) async {
    // instanciamos os timers e iniciamos.
    PausableTimer notificationTimer = PausableTimer(Duration(), () => {});
    notificationTimer = PausableTimer(
        Duration(seconds: (user_model.getNotificationTime())),
        () => {resetNotificationTimer(notificationTimer)});
    PausableTimer dailyGoal = PausableTimer(
        Duration(seconds: (user_model.getDailyGoal())), activateGreyScale);
    PausableTimer halfedDailyGoal = PausableTimer(
        Duration(seconds: ((user_model.getDailyGoal() / 2).round())),
        activateGreyScale);
    startTimers(
        timerController, [notificationTimer, dailyGoal, halfedDailyGoal]);

    // observando o evento 24/7
    late StreamSubscription<ScreenStateEvent> _subscription;
    Screen _screen = Screen();
    _subscription = _screen.screenStateStream!.listen((ScreenStateEvent event) {
      if (event == ScreenStateEvent.SCREEN_UNLOCKED) {
        if (!notificationTimer.isActive) {
          timerController.resume();
          startTimers(
              timerController, [notificationTimer, dailyGoal, halfedDailyGoal]);
        }
      } else if (event == ScreenStateEvent.SCREEN_OFF) {
        timerController.pause();
        int newDuration = updateNotificationTime(notificationTimer);
        notificationTimer = PausableTimer(Duration(seconds: newDuration),
            () => {resetNotificationTimer(notificationTimer)});
        //timer.reset();
        notificationTimer.pause();
        dailyGoal.pause();
        halfedDailyGoal.pause();
      }
    });
  }

  void startTimers(timerController, List<PausableTimer> timersList) {
    int now = Timestamp.now().toDate().day;
    if (createdAt != now) {
      for (PausableTimer timer in timersList) {
        timer.reset();
      }
      timerController.restart();
      createdAt = now;
    }
    for (PausableTimer timer in timersList) {
      timer.start();
    }
  }

  void resetNotificationTimer(PausableTimer notificationTimer) {
    if (notificationTimer.duration != user_model.getNotificationTime()) {
      notificationTimer = PausableTimer(
          Duration(seconds: (user_model.getNotificationTime())),
          () => {resetNotificationTimer(notificationTimer)});
    }
    //aqui vai a chamada do metodo que cria e envia a notificação
    notificationTimer.reset();
    notificationTimer.start();
  }

  int updateNotificationTime(PausableTimer notificationTimer) {
    int t = notificationTimer.elapsed.inSeconds;
    int aux = ((notificationTimer.duration.inSeconds) - t);
    notificationTimer.cancel();
    return aux;
  }

  void activateGreyScale() {
    //TO-DO: Função q ativa o greyscale
  }
}
