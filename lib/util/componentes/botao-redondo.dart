import 'package:flutter/material.dart';
import 'package:awesome_button/awesome_button.dart';

class BotaoRedondo extends StatelessWidget {
  final IconData icone;
  final Color cor;
  final Function metodo;

  BotaoRedondo({Key key, this.icone = Icons.adb, this.cor = Colors.blue, this.metodo});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 60.0,
        width: 60.0,
        child: AwesomeButton(
          blurRadius: 10.0,
          splashColor: Color.fromRGBO(255, 255, 255, .4),
          borderRadius: BorderRadius.circular(50.0),
          onTap: metodo,
          color: cor,
          child: Icon(
            icone,
            color: Colors.white,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
