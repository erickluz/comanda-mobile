import 'package:comanda/modal/Produto.dart';

class ItemComanda {
  int id;
  int quantidade;
  Produto produto;

  ItemComanda({this.id, this.produto, this.quantidade});

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantidade': quantidade,
        'produto': produto,
      };

  factory ItemComanda.fromJson(Map<String, dynamic> json) {
    return ItemComanda(id: json['id'], quantidade: json['quantidade'], produto: Produto.fromJson(json['produto']));
  }
}
