import 'package:comanda/modal/Produto.dart';

class ItemComanda {
  int id;
  int quantidade;
  Produto produto;

  ItemComanda({this.id, this.produto, this.quantidade});

  factory ItemComanda.fromJson(Map<String, dynamic> json) {
    return ItemComanda(
        id: json['id'],
        quantidade: json['quantidade'],
        produto: Produto.fromJson(json['produto']));
  }
}
