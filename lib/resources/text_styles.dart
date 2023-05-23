import 'package:flutter/material.dart';
import 'package:front/components/home_componenets/card_frases/card_frases.dart';
import 'package:front/components/home_componenets/countdown_timer.dart';
import 'package:front/resources/color_pattern.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  static TextStyle header_1 =
      GoogleFonts.redHatText(fontSize: 32, fontWeight: FontWeight.w400);
  static TextStyle header_2 =
      GoogleFonts.redHatText(fontSize: 26, fontWeight: FontWeight.w500);
  static TextStyle header_3 =
      GoogleFonts.redHatText(fontSize: 24, fontWeight: FontWeight.w400);
  static TextStyle title_1 =
      GoogleFonts.redHatText(fontSize: 20, fontWeight: FontWeight.w400);
  static TextStyle title_2 =
      GoogleFonts.redHatText(fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle body_1 =
      GoogleFonts.redHatText(fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle body_2 =
      GoogleFonts.redHatText(fontSize: 18, fontWeight: FontWeight.w400);
  static TextStyle body_3 = 
      GoogleFonts.redHatText(fontSize: 18, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic);
  static TextStyle body_4 = 
      GoogleFonts.redHatText(fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle body_5 =
      GoogleFonts.redHatText(fontSize: 15, fontWeight: FontWeight.w400);
  static TextStyle body_6 =
      GoogleFonts.redHatText(fontSize: 14, fontWeight: FontWeight.w700);
}

class CustomTextStylesBuilder {
  Color? _color;
  double? _fontSize;
  TextDecoration? _decoration;

  TextStyle header1() {
    return GoogleFonts.redHatText(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: _color,
        decoration: _decoration);
  }

  TextStyle header2() {
    return GoogleFonts.redHatText(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: _color,
        decoration: _decoration);
  }

  TextStyle header3() {
    return GoogleFonts.redHatText(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: _color,
        decoration: _decoration);
  }

  TextStyle title1() {
    return GoogleFonts.redHatText(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: _color,
        decoration: _decoration);
  }

  TextStyle title2() {
    return GoogleFonts.redHatText(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: _color,
      decoration: _decoration,
    );
  }

  TextStyle body1() {
    return GoogleFonts.redHatText(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: _color,
        decoration: _decoration);
  }

  TextStyle body2() {
    return GoogleFonts.redHatText(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: _color,
        decoration: _decoration);
  }

  TextStyle body3() {
    return GoogleFonts.redHatText(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: _color,
        decoration: _decoration);
  }

  TextStyle body4() {
    return GoogleFonts.redHatText(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: _color,
        decoration: _decoration);
  }

  TextStyle body5() {
    return GoogleFonts.redHatText(
        fontSize: 15, fontWeight: FontWeight.w400, color: _color);
  }

  TextStyle body6() {
    return GoogleFonts.redHatText(
        fontSize: 14, fontWeight: FontWeight.w700, color: _color);
  }

  TextStyle greenTextForm(){
    return CustomTextStylesBuilder()
    .withColor(ColorPattern.green)
    .body6();
  }

  TextStyle whiteTextForm(){
    return CustomTextStylesBuilder()
    .withColor(ColorPattern.white)
    .header1();
  }

  TextStyle greenPopUpButton(){
    return CustomTextStylesBuilder()
    .withColor(ColorPattern.green)
    .title1();
  }

  TextStyle whitePopUpButton(){
    return CustomTextStylesBuilder()
    .withColor(ColorPattern.white)
    .title1();
  }

  TextStyle notificationTimeNumber(double? fontSize){
    return CustomTextStylesBuilder()
    .withColor(ColorPattern.green)
    .withFontSize(fontSize)
    .body1();
  }

  TextStyle notificationTimeText(double? fontSize){
    return CustomTextStylesBuilder()
    .withColor(ColorPattern.white)
    .withFontSize(fontSize)
    .title1();
  }

  TextStyle cardFrases(){
    return CustomTextStylesBuilder()
    .withColor(ColorPattern.white)
    .body4();
  }

  TextStyle listaFrases(double? fontSize){
    return CustomTextStylesBuilder()
    .withColor(ColorPattern.white)
    .withFontSize(fontSize)
    .withFontStyle(FontStyle.italic)
    .body3();
  }

  TextStyle timer(double? fontSize){
    return CustomTextStylesBuilder()
    .withColor(ColorPattern.white)
    .withFontSize(fontSize)
    .header3();
  }

  TextStyle endTimer(double? fontSize){
    return CustomTextStylesBuilder()
    .withColor(ColorPattern.whiteOpacity)
    .withFontSize(fontSize)
    .body5();
  }

  CustomTextStylesBuilder withColor(Color color) {
    _color = color;
    return this;
  }

  CustomTextStylesBuilder withFontSize(double? fontSize) {
    _fontSize = fontSize;
    return this;
  }

  CustomTextStylesBuilder withFontStyle(FontStyle? fontStyle) {
    return this;
  }
}
