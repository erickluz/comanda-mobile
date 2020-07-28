import 'package:comanda/modal/Comanda.dart';
import 'package:comanda/screens/main/comanda/components/item-de-comanda.dart';
import 'package:comanda/util/util.dart';
import 'package:flutter/material.dart';

class BodyListagemItensComanda extends StatelessWidget {
  final List<ComponenteItemComanda> itensComanda;
  final Function() adicionaItemComanda;
  final Function salvarComanda;
  final Comanda comanda;

  BodyListagemItensComanda({Key key, this.itensComanda, @required this.adicionaItemComanda, @required this.salvarComanda, @required this.comanda});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.only(bottom: 150.0),
            itemCount: itensComanda.length,
            itemBuilder: (BuildContext bc, itemIndex) {
              return itensComanda[itemIndex];
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70.0,
          color: Colors.blue,
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 150,
                  height: 50,
                  child: Text("Preço Total: \n" + Util.formataDinheiro(comanda.valorTotal), style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(right: 3),
            child: FloatingActionButton.extended(
              heroTag: "btnSalvar",
              onPressed: () {
                salvarComanda();
              },
              elevation: 12,
              label: Text("Salvar"),
              backgroundColor: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: FloatingActionButton(
              heroTag: "btnAdicionar",
              onPressed: () {
                adicionaItemComanda();
              },
              elevation: 12,
              child: Icon(Icons.add),
            ),
          ),
        ]),
      ),
    );
  }
}
