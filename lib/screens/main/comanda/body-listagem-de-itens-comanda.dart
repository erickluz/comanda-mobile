import 'package:comanda/modal/Comanda.dart';
import 'package:comanda/screens/main/comanda/components/item-de-comanda.dart';
import 'package:comanda/service/comanda-service.dart';
import 'package:flutter/material.dart';

class BodyListagemItensComanda extends StatelessWidget {
  final List<ItemListaComanda> itensComanda;
  final Function(String nomeItem, double preco, int quantidade)
      adicionaItemComanda;
  final double valorTotalDaComanda;
  final int numeroMesa;

  BodyListagemItensComanda(
      {Key key,
      this.itensComanda,
      this.adicionaItemComanda,
      @required this.valorTotalDaComanda,
      @required this.numeroMesa});

  @override
  Widget build(BuildContext context) {
    ComandaService service = new ComandaService();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 10,
              child: FutureBuilder<Comanda>(
                  future: service.buscaComandaCompleta(numeroMesa),
                  builder:
                      (BuildContext context, AsyncSnapshot<Comanda> snapshot) {
                    Widget filho;
                    if (snapshot.connectionState == ConnectionState.done) {
                      itensComanda.clear();
                      if (snapshot.hasData) {
                        Comanda comandaServidor = snapshot.data;
                        comandaServidor.itensComanda.forEach((comanda) {
                          itensComanda.add(new ItemListaComanda(
                            nomeItem: comanda.produto.nome,
                            preco: comanda.produto.preco,
                            quantidade: comanda.quantidade,
                          ));
                        });
                        filho = ListView(
                          children: List.generate(itensComanda.length, (index) {
                            return itensComanda[index];
                          }),
                        );
                      } else {
                        filho = Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.grey,
                              size: 90,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                  'Não foi possível carregar as comandas !!!'),
                            )
                          ],
                        );
                      }
                    } else {
                      filho = Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: CircularProgressIndicator(),
                            width: 60,
                            height: 60,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Carregando comandas...'),
                          )
                        ],
                      );
                    }
                    return Center(child: filho);
                  })),
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
                      child: Text("Preço Total: \n R\$ $valorTotalDaComanda",
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
