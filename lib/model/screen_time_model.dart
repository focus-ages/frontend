import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:front/model/notification_model.dart';
import 'package:screen_state/screen_state.dart';
import 'user_model.dart';
import '../controller/user_controller.dart';
import 'package:pausable_timer/pausable_timer.dart';



class ScreenTimeModel {
  static final ScreenTimeModel screenTimeModel = ScreenTimeModel._internal();
  final User_model user_model = User_model();
  final UserController userController = UserController();
  final NotificationModel notificationModel = NotificationModel();
  int createdAt = Timestamp.now().toDate().day;

  factory ScreenTimeModel() {
    return screenTimeModel;
  }

  ScreenTimeModel._internal();

  void collectScreenData(CountDownController timerController) async {
    // instanciamos os timers e iniciamos.
    PausableTimer notificationTimer = PausableTimer(Duration(), () => {});
    notificationTimer = PausableTimer(
        Duration(seconds: (user_model.user.notificationTime!)),
        () => {resetNotificationTimer(notificationTimer)});
    PausableTimer dailyGoal = PausableTimer(
        Duration(seconds: (user_model.user.dailyGoal!)), activateGreyScale);
    PausableTimer halfedDailyGoal = PausableTimer(
        Duration(seconds: ((user_model.user.dailyGoal! / 2).round())),
        activateGreyScale);
    startTimers(
        timerController, [notificationTimer, dailyGoal, halfedDailyGoal]);

    // observando o evento 24/7
    Screen _screen = Screen();
    _screen.screenStateStream!.listen((ScreenStateEvent event) {
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
      print('mandou a noitificacao o/');
      notificationModel.showNotification();
    if (notificationTimer.duration != user_model.user.notificationTime!) {
      notificationTimer = PausableTimer(
          Duration(seconds: (user_model.user.notificationTime!)),
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
