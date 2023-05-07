import 'package:flutter/material.dart';
import 'package:front/view/cadastro/form_view.dart';
import 'package:front/view/home/home_view.dart';

import '../../model/user_model.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);



  @override
  State<Splash> createState() => _SplashState();
}


//fazer AQUI toda a logica de ver se o user tem cadastro e direcionamento das paginas

class _SplashState extends State<Splash> {

  final User_model userModel = User_model();
  @override
  void initState(){
    super.initState();

    userModel.loadUserFromStorage().then((value) => {
        if(value.isEmpty){
          _navigatecadastro()
        }else{
          _navigatehome()
        } //12
    });
  }

  _navigatehome() async {
    await Future.delayed(Duration(seconds: 5), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }

  _navigatecadastro() async {
    await Future.delayed(Duration(seconds: 5), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Cadastro()));
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
      )
    );
    }
  }