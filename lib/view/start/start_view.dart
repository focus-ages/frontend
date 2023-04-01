
import 'package:flutter/material.dart';
import '../../components/custom_button.dart';
import '../../resources/color_pattern.dart';

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
      body: Center (child:
        Column(
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
                  color:Colors.white,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}