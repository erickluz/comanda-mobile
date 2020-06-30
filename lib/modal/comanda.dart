import 'package:comanda/modal/ItemComanda.dart';
import 'package:comanda/modal/Produto.dart';

class Comanda {
  int id;
  int numero;
  String nomeCliente;
  String horaAbertura;
  String horaFechamento;
  double valorTotal;
  List<ItemComanda> itensComanda = new List<ItemComanda>();

  Comanda(
      {this.id,
      this.numero,
      this.nomeCliente,
      this.horaAbertura,
      this.horaFechamento,
      this.valorTotal,
      this.itensComanda});

  factory Comanda.fromJson(Map<String, dynamic> json) {
    List<ItemComanda> listaComanda;
    if (json['itensComanda'] != null) {
      listaComanda = (json['itensComanda'] as List)
          .map((itemComanda) => ItemComanda.fromJson(itemComanda))
          .toList();
    }

    return Comanda(
      id: json['id'],
      numero: json['numero'],
      nomeCliente: json['nomeCliente'],
      horaAbertura: json['horaAbertura'],
      horaFechamento: json['horaFechamento'],
      valorTotal: json['valorTotal'].toDouble(),
      itensComanda: listaComanda,
    );
  }

  void adicionarItemComanda(Produto produto, int quantidade) {
    this
        .itensComanda
        .add(new ItemComanda(produto: produto, quantidade: quantidade));
  }
}
