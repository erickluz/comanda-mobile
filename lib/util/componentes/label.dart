import 'package:flutter/material.dart';

class LabelTexto extends StatelessWidget {

  final String texto;

  LabelTexto({Key key, this.texto="-"});

  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(this.texto, style: (TextStyle(fontSize: 21))),
      );
  }
}