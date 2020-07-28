import 'package:comanda/util/componentes/botao.dart';
import 'package:flutter/material.dart';

class ResumoComanda extends StatelessWidget {
  final int numeroComanda;
  final String horarioAbertura;
  final String horarioFechamento;
  final String nomeCliente;
  ResumoComanda({Key key, this.numeroComanda, this.horarioAbertura, this.horarioFechamento, this.nomeCliente});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mesa $numeroComanda",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Hora de abertura: $horarioAbertura",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Hora de fechamento: $horarioFechamento",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Nome do cliente: $nomeCliente",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 9.0),
            child: Row(
              children: [
                Botao(
                  cor: Colors.blue,
                  texto: "Visualizar",
                ),
                Botao(
                  cor: Colors.red,
                  texto: "Excluir",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
