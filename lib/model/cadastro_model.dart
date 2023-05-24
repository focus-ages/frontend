import 'package:introduction_screen/introduction_screen.dart';
import '../resources/color_pattern.dart';
import 'package:flutter/material.dart';

class CadastroModel {
  static final CadastroModel cadastroModel = CadastroModel._internal();

  factory CadastroModel() {
    return cadastroModel;
  }

  CadastroModel._internal();

  DotsDecorator getDotDecorator() {
    return DotsDecorator(
      color: ColorPattern.white,
      size: Size(15, 15),
      activeSize: Size(20, 20),
      activeColor: ColorPattern.green,
    );
  }

  String getCurrentText(int numberPage) {
    switch (numberPage) {
      case 0:
        {
          return 'Seja sua melhor versão!';
        }
      case 1:
        {
          return 'Supere seus limites diariamente!';
        }
      case 2:
        {
          return 'Faça ou não faça. Tentativa não há!';
        }
      default:
        {
          return 'Vença os desafios diários!';
        }
    }
  }

  PageDecoration getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, color: ColorPattern.green),
      bodyTextStyle: TextStyle(fontSize: 20),
      titlePadding: EdgeInsets.all(8).copyWith(top: 0),
      imagePadding: EdgeInsets.all(8),
    );
  }
}
