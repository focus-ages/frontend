import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../components/home_componenets/custom_button.dart';
import '../../resources/color_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BancoPage extends StatefulWidget {
  const BancoPage({Key? key}) : super(key: key);

  @override
  State<BancoPage> createState() => _BancoPage();
}

void testeCinza() async {
  const platform = MethodChannel(
      'channel_name'); // Substitua 'channel_name' pelo nome do canal que você definir no lado nativo (Android).

  try {
    await platform.invokeMethod('enableGrayscale');
  } on PlatformException catch (e) {
    print('Error: $e');
  }
}

class _BancoPage extends State<BancoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPattern.darkMode,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomButton(
                onPressed: testeCinza,
                title: Text(
                  "testeCinza",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomButton(
                onPressed: testeCinza,
                title: Text(
                  "testeCinza",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomButton(
                onPressed: testeCinza,
                title: Text(
                  "testeCinza",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10)
        ],
      )),
    );
  }
}
