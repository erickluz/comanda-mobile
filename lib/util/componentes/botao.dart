import 'package:flutter/material.dart';

class Botao extends StatelessWidget {

  final String texto;
  final IconData icone;
  final Color cor;
  final Function metodo;

  Botao({Key key, this.texto = '', this.icone = Icons.adb, this.cor = Colors.blue, this.metodo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: ButtonTheme(
          minWidth: double.infinity,
          child: RaisedButton.icon(
          onPressed: metodo, 
          icon: Icon(icone), 
          label: Text(texto),
          color: cor,
        ),
      ),
    );
  }
}