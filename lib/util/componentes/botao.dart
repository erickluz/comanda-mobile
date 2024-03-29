import 'package:awesome_button/awesome_button.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final Color cor;
  final Function metodo;

  Botao({Key key, this.texto = '', this.icone = Icons.adb, this.cor = Colors.blue, this.metodo});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 60.0,
        width: 160.0,
        child: AwesomeButton(
          blurRadius: 10.0,
          splashColor: Color.fromRGBO(255, 255, 255, .4),
          borderRadius: BorderRadius.circular(50.0),
          onTap: metodo,
          color: cor,
          child: Text(
            texto,
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
      ),
    );
  }
}
