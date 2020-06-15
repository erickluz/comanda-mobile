import 'package:flutter/material.dart';
import 'package:comanda/util/util.dart';

class ItemListaComanda extends StatelessWidget {
  final String nomeItem;
  final double preco;
  final int quantidade;

  ItemListaComanda(
      {Key key, this.nomeItem = "Item não cadastrado", this.preco = 0.0, this.quantidade = 1});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.category),
      title: Text(
        this.nomeItem,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
      ),
      subtitle: Text(
        "Preço: " + Util.formataDinheiro(this.preco * this.quantidade) + " Quantidade: $quantidade",
      ),
    );
  }
}