import 'package:flutter/material.dart';
import '../../components/home_componenets/custom_button.dart';
import '../../resources/color_pattern.dart';

int tempo = 60;
int min = 0;

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
