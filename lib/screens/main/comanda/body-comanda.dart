import 'package:comanda/modal/Produto.dart';
import 'package:comanda/screens/main/comanda/body-descricao-comanda.dart';
import 'package:comanda/screens/main/comanda/body-listagem-de-itens-comanda.dart';
import 'package:comanda/screens/main/comanda/body-selecao-de-produtos.dart';
import 'package:comanda/screens/main/comanda/components/item-de-comanda.dart';
import 'package:comanda/util/util.dart';
import 'package:flutter/material.dart';

class BodyComanda extends StatefulWidget {
  final int numeroComanda;
  BodyComanda({this.numeroComanda});

  @override
  _BodyComanda createState() => _BodyComanda(numeroComanda: numeroComanda);
}

class _BodyComanda extends State<BodyComanda> {
  final numeroComanda;
  _BodyComanda({this.numeroComanda});
  List<ItemListaComanda> itensComanda = new List<ItemListaComanda>();
  List<Produto> produtos = new List();
  Produto produto;
  double valorTotalComanda = 0;

  void selecionarProduto(Produto produto) {
    setState(() {
      itensComanda.add(ItemListaComanda(
        nomeItem: produto.nome,
        preco: produto.preco,
        quantidade: 1,
      ));
      Navigator.pop(context);
    });
  }

  double valorTotalDaComanda() {
    setState(() {
      double valorTotal = 0;
      for (ItemListaComanda item in itensComanda) {
        valorTotal += item.preco * item.quantidade;
      }
      return Util.formataDinheiro(valorTotal);
    });
  }

  void adicionarItemNaComanda(String nomeItem, double preco, int quantidade) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BodySelecaoProduto(
                  produtoSelecionado: produto,
                  selecionarProduto: selecionarProduto,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Itens da comanda",
                ),
                Tab(
                  text: "Detalhes",
                )
              ],
            ),
            title: Text("Comanda"),
            actions: [
              Icon(Icons.print),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {},
              ),
            ],
          ),
          body: TabBarView(
            children: [
              BodyListagemItensComanda(
                itensComanda: itensComanda,
                adicionaItemComanda: adicionarItemNaComanda,
                valorTotalDaComanda: valorTotalComanda,
                numeroMesa: numeroComanda,
              ),
              BodyDescricaoComanda()
            ],
          ),
        ));
  }
}
