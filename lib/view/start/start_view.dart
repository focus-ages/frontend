import 'package:flutter/material.dart';
import 'package:is_lock_screen/is_lock_screen.dart';
import 'package:pausable_timer/pausable_timer.dart';
import '../../components/home_componenets/custom_button.dart';
import '../../model/notification.dart';
import '../../resources/color_pattern.dart';

int tempo = 60;
int min = 0;

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with WidgetsBindingObserver {

/*  final timer = PausableTimer(Duration(seconds: tempo), () => {});
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    while (true) {
      if (timer.isExpired) {
        print('envia pro db -ficou o tempo todo');
        timer.reset();
        min++;
        print('$min');
      } else if (timer.isActive && await isLockScreen() == true) {
        print('envia pro db- terminou antes');
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
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPattern.darkMode,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            title: const Text(
              "START",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
