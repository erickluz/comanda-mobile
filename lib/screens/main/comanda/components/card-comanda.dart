import 'package:comanda/modal/Comanda.dart';
import 'package:comanda/screens/main/comanda/body-comanda.dart';
import 'package:comanda/screens/main/comanda/body-resumo-comanda.dart';
import 'package:flutter/material.dart';

class CardComanda extends StatelessWidget {
  final Comanda comanda;
  final Function listarComandas;

  CardComanda({Key key, this.comanda, this.listarComandas});

  @override
  Widget build(BuildContext context) {
    int numero = comanda.numero;
    return Card(
      child: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BodyComanda(
                        numeroComanda: this.comanda.numero,
                      ))).then((value) {
            listarComandas();
          });
        },
        onLongPress: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: ResumoComanda(
                        numeroComanda: this.comanda.numero,
                        horarioAbertura: this.comanda.horaAbertura,
                        horarioFechamento: this.comanda.horaFechamento,
                        nomeCliente: this.comanda.nomeCliente,
                      ),
                    );
                  },
                );
              });
        },
        splashColor: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("Mesa $numero", style: Theme.of(context).textTheme.headline6),
          ),
        ),
      ),
    );
  }
}
