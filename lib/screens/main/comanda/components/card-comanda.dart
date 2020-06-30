import 'package:comanda/screens/main/comanda/body-comanda.dart';
import 'package:flutter/material.dart';

class CardComanda extends StatelessWidget {
  final int numeroDaMesa;

  CardComanda({this.numeroDaMesa = 0});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BodyComanda(
                        numeroComanda: numeroDaMesa,
                      )));
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
