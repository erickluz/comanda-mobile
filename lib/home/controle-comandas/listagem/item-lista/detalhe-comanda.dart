import 'dart:developer';

import 'package:comanda/home/controle-comandas/listagem/item-lista/descricao-comanda.dart';
import 'package:comanda/home/controle-comandas/listagem/item-lista/item-lista-comanda.dart';
import 'package:comanda/home/controle-comandas/listagem/lista-item-comanda.dart';
import 'package:comanda/modal/produto.dart';
import 'package:comanda/selecao-produto.dart';
import 'package:comanda/service/comanda-service.dart';
import 'package:flutter/material.dart';

class DetalheComanda extends StatefulWidget {
  final int numeroComanda;
  DetalheComanda({this.numeroComanda});

  @override
  _DetalheComandaState createState() => _DetalheComandaState(numeroComanda: numeroComanda);
}

class _DetalheComandaState extends State<DetalheComanda> {
  final numeroComanda;
  _DetalheComandaState({this.numeroComanda});
  List<ItemListaComanda> itensComanda = new List<ItemListaComanda>();
  List<Produto> produtos = new List();
  Produto produto;
  ComandaService service;

  void selecionarProduto(Produto produto) {
    setState(() {
      itensComanda.add(ItemListaComanda(
        nomeItem: produto.nome,
        preco: produto.preco,
        quantidade: 1,
      ));
      print(produto.id);
      Navigator.pop(context);
    });
  }

  void adicionarItemNaComanda(String nomeItem, double preco, int quantidade) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SelecaoProduto(
                  produtoSelecionado: produto,
                  selecionarProduto: selecionarProduto,
                )));
  }

  @override
  Widget build(BuildContext context) {
    service = new ComandaService();
    print('Comanda selecionada');
    print(service.buscaComandaCompleta(this.numeroComanda));
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
            leading: Icon(Icons.arrow_back),
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
              ListaItensComanda(
                itensComanda: itensComanda,
                adicionaItemComanda: adicionarItemNaComanda,
              ),
              DescricaoComanda()
            ],
          ),
        ));
  }
}
