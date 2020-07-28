import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogInputNumber extends StatelessWidget {
  final TextEditingController customController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Insira o número da mesa/comanda"),
      content: TextField(
        autofocus: true,
        keyboardType: TextInputType.number,
        controller: customController,
      ),
      actions: [
        MaterialButton(
          elevation: 5.0,
          child: Text("Confirmar"),
          onPressed: () {},
        )
      ],
    );
  }
}
