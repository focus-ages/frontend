import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget{
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/imagem.png', height: 400,),
            const SizedBox(height: 30,),
            if (Platform.isIOS)
            const CupertinoActivityIndicator(
              radius: 15,
            )
            else
              const CircularProgressIndicator(
                  color: Colors.grey,
              )
            ],
        ) 
      ),
    );
  }
}