import 'package:flutter/material.dart';
import 'screens/login/pre-login.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Minha Comanda", theme: ThemeData(backgroundColor: Color(0xb5b5b5)), builder: BotToastInit(), navigatorObservers: [BotToastNavigatorObserver()], home: PreLogin());
  }
}
