import 'package:comanda/home/controle-comandas/listagem/item-lista/item-lista-comanda.dart';
import 'package:comanda/service/comanda-service.dart';
import 'package:comanda/util/util.dart';
import 'package:flutter/material.dart';

class ListaItensComanda extends StatelessWidget {
  List<ItemListaComanda> itensComanda;
  final Function(String nomeItem, double preco, int quantidade)
      adicionaItemComanda;
  ComandaService service = new ComandaService();

  ListaItensComanda({Key key, this.itensComanda, this.adicionaItemComanda});

  String valorTotalDaComanda() {
    double valorTotal = 0;
    for (ItemListaComanda item in itensComanda) {
      valorTotal += item.preco * item.quantidade;
    }
    return Util.formataDinheiro(valorTotal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: ListView(
              children: List.generate(itensComanda.length, (index) {
                return itensComanda[index];
              }),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.blue,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 150,
                      height: 50,
                      child: Text("Preço Total: \n " + valorTotalDaComanda(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          onPressed: () {
            adicionaItemComanda("asd", 2.0, 1);
          },
          elevation: 12,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}