import 'package:flutter/material.dart';
import 'package:front/view/cadastro/form_view.dart';
import 'package:front/view/home/home_view.dart';
import 'package:front/view/home/teste.dart';

import '../../model/user_model.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final User_model userModel = User_model();
  @override
  void initState() {
    super.initState();

    userModel.loadUserFromDB().then((isLoaded) => {
          if (!isLoaded) {_navigatecadastro()} else {_navigatehome()}
        });
  }

  _navigatehome() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BancoPage()));
  }

  _navigatecadastro() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BancoPage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(0, 126, 126, 126),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          'images/icone.png',
          height: 200.0,
          width: 200.0,
        ),
      ),
    ));
  }
}
