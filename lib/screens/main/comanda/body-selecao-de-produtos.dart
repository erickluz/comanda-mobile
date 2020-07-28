import 'package:comanda/modal/Produto.dart';
import 'package:comanda/screens/main/comanda/components/item-de-produto.dart';
import 'package:comanda/service/produto-service.dart';
import 'package:flutter/material.dart';

class SelecaoProdutos extends StatelessWidget {
  final ProdutoService produtoService = new ProdutoService();
  final Function(Produto produto) selecionarProduto;

  SelecaoProdutos({Key key, this.selecionarProduto});

  @override
  Widget build(BuildContext context) {
    List<Produto> produtos = new List();
    return Column(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 6, left: 8.0, right: 8.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Filtrar produtos...', border: OutlineInputBorder()),
              ),
            )),
        Expanded(
            flex: 9,
            child: FutureBuilder<List<Produto>>(
                future: produtoService.listarProdutos(),
                builder: (BuildContext context, AsyncSnapshot<List<Produto>> snapshot) {
                  Widget filho;
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      produtos = snapshot.data;
                      filho = ListView(
                        children: List.generate(
                            produtos.length,
                            (index) => ItemListaProduto(
                                  produto: produtos[index],
                                  selecionaProduto: selecionarProduto,
                                )),
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
                            child: Text('Não foi possível carregar produtos !!!'),
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
                          child: Text('Carregando produtos...'),
                        )
                      ],
                    );
                  }
                  return Center(child: filho);
                })),
      ],
    );
  }
}
