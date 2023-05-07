import 'dart:async';
import 'package:screen_state/screen_state.dart';
import 'user_model.dart';
import '../controller/user_controller.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//receberia a funcao getTime, mas ela esta sempre retornando 0 - setei 1 minuto na linha abaixo
final timer = PausableTimer(Duration(minutes: (1)), () => {resetTimer()});

final User_model user_model = User_model();
final UserController userController = UserController();

class ScreenUsage {
  //int? tempoemsegundos =(tempo!/60).round()

  ScreenUsage();
  void collectScreenData() async {
    timer.start();
    late StreamSubscription<ScreenStateEvent> _subscription;
    Screen _screen = Screen();
    _subscription = _screen.screenStateStream!.listen((ScreenStateEvent event) {
      if (event == ScreenStateEvent.SCREEN_ON) {
        if (!timer.isActive) {
          timer.start();
        }
      } else if (event == ScreenStateEvent.SCREEN_OFF) {
        //envia para o banco o tempo usado em segundos
        saveUser(timer.elapsed.inSeconds);
        timer.reset();
        timer.pause();
      }
    });
  }
}

void saveUser(int seg) {
  userController.findUser(user_model.userId).then((user) => {
        user?.timeUsed = user.timeUsed + seg,
        if (user!.timeUsed > (user.notificationTime * 60))
          {
            //print('passou do tempo'), //chama a funcao para agendar a notificao
            user.timeUsed = user.timeUsed - (user.notificationTime * 60)
          },
        userController.updateUser(user_model.userId, user),
      });
}

void resetTimer() {
  //caso o usuario fique o tempo todo com a tela ligada, o timer reseta e envia para o banco
  saveUser(timer.elapsed.inSeconds);
  timer.reset();
  timer.start();
}

//Esta sempre retornando 0 - erro tecnico
Future<int?> getTime() async {
  return await userController
      .findUser(user_model.userId)
      .then((user) => user?.dailyGoal);
}
