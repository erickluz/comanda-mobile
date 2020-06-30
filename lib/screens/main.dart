import 'package:flutter/material.dart';
import 'login/pre-login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Color(0xb5b5b5)),
      home: PreLogin(),
    );
  }
}