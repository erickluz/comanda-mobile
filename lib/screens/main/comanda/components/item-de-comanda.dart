import 'package:comanda/modal/Produto.dart';
import 'package:flutter/material.dart';
import 'package:comanda/util/util.dart';

class ComponenteItemComanda extends StatelessWidget {
  final Produto produto;
  final int quantidade;
  final Function(Produto produto, int quantidade) selecionarItemComanda;
  final Function(int idProduto) removerItemComanda;

  ComponenteItemComanda({Key key, this.produto, this.quantidade = 1, this.selecionarItemComanda, this.removerItemComanda});

  Widget refreshBg() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(produto.nome),
      background: refreshBg(),
      child: ListTile(
        leading: Icon(Icons.category),
        title: Text(
          produto.nome,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        subtitle: Text(
          "Preço: " + Util.formataDinheiro(produto.preco * this.quantidade) + " Quantidade: $quantidade",
        ),
        onTap: () => selecionarItemComanda(this.produto, this.quantidade),
      ),
      onDismissed: (direction) => removerItemComanda(produto.id),
    );
  }
}
