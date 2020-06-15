import 'package:comanda/home/controle-comandas/listagem/item-lista/detalhe-comanda.dart';
import 'package:flutter/material.dart';

class BoxComanda extends StatelessWidget {

  final int numeroDaMesa;

  BoxComanda({this.numeroDaMesa=0});

  @override
  Widget build(BuildContext context) {
    return Card(
          child: InkWell(
        onTap: ()  {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetalheComanda(numeroComanda: numeroDaMesa,)));
        },
        splashColor: Colors.blue,
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("Mesa $numeroDaMesa",
                style: Theme.of(context).textTheme.headline6),
          ),
        ),
      ),
    );
  }
}