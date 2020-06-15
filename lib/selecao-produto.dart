import 'package:comanda/modal/produto.dart';
import 'package:comanda/service/produto-service.dart';
import 'package:flutter/material.dart';

class ItemListaProduto extends StatelessWidget {
  final Produto produto;
  final Function(Produto produto) selecionaProduto;

  ItemListaProduto({@required this.produto, @required this.selecionaProduto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        shadowColor: Colors.black,
        elevation: 10.0,
        borderOnForeground: true,
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            selecionaProduto(this.produto);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  height: 80,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 5,
                        left: 10,
                        child: Text(
                          this.produto.nome,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 10,
                        child: Container(
                            child: Text(
                          "Preço: " + this.produto.preco.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.start,
                        )),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    width: double.infinity,
                    height: 80.0,
                    child: Container(
                        width: 20,
                        height: 20,
                        child: Container(
                          color: Colors.white,
                          child: Image.asset(
                            "assets/hamburguer_drink.png",
                            fit: BoxFit.cover,
                          ),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelecaoProduto extends StatefulWidget {
  final Produto produtoSelecionado;
  final Function(Produto produto) selecionarProduto;
  SelecaoProduto(
      {Key key,
      @required this.produtoSelecionado,
      @required this.selecionarProduto});

  @override
  _SelecaoProdutoState createState() =>
      _SelecaoProdutoState(this.produtoSelecionado, this.selecionarProduto);
}

class _SelecaoProdutoState extends State<SelecaoProduto> {
  Produto produtoSelecionado;
  Function selecionarProduto;
  List<Produto> produtos = new List();
  _SelecaoProdutoState(this.produtoSelecionado, this.selecionarProduto);
  ProdutoService produtoService = new ProdutoService();

  @override
  void initState() {
    super.initState();
    this.produtos.add(Produto(id: 1, nome: "Subzero", preco: 2.50));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Seleção de produtos"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6, left: 8.0, right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Filtrar produtos...',
                        border: OutlineInputBorder()),
                  ),
                )),
            Expanded(
                flex: 9,
                child: FutureBuilder<List<Produto>>(
                    future: produtoService.listarProdutos(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Produto>> snapshot) {
                      Widget filho;
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          this.produtos = snapshot.data;
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
                                child: Text(
                                    'Não foi possível carregar produtos !!!'),
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
        ));
  }
}
