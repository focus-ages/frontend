import 'package:flutter/material.dart';
import 'package:front/view/app_widget.dart';
import 'model/screen_usage.dart';

void main() {
  runApp(const AppWidget());
  collectScreenData();
}

@override
void didChangeAppLifecycleState(AppLifecycleState state) async {
  if (state == AppLifecycleState.detached) {
    print('foi de arrasta');
  }
}
