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

  Comanda({this.id, this.numero, this.nomeCliente, this.horaAbertura, this.horaFechamento, this.valorTotal, this.itensComanda});

  void alterarQuantidadeItemComanda(Produto produto, int quantidade) {
    for (int i = 0; i < this.itensComanda.length; i++) {
      if (this.itensComanda[i].produto.id == produto.id) {
        this.itensComanda[i].quantidade = quantidade;
        break;
      }
    }
    _atualizarValorTotal();
  }

  void adicionarNumeroItemComanda(Produto produto) {
    bool isAdiociona = true;
    // for (ItemComanda item in this.itensComanda) {
    for (int i = 0; i < this.itensComanda.length; i++) {
      if (this.itensComanda[i].produto.id == produto.id) {
        this.itensComanda[i].quantidade++;
        isAdiociona = false;
        break;
      }
    }
    if (isAdiociona) {
      this.itensComanda.add(new ItemComanda(produto: produto, quantidade: 1));
    }
    _atualizarValorTotal();
  }

  void _atualizarValorTotal() {
    double valorTotal = 0;
    this.itensComanda.forEach((item) {
      valorTotal += item.produto.preco * item.quantidade;
    });
    this.valorTotal = valorTotal;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'numero': numero,
        'nomeCliente': nomeCliente,
        'horaAbertura': horaAbertura,
        'horaFechamento': horaFechamento,
        'valorTotal': valorTotal,
        'itensComanda': itensComanda
      };

  factory Comanda.fromJson(Map<String, dynamic> json) {
    List<ItemComanda> listaComanda;
    if (json['itensComanda'] != null) {
      listaComanda = (json['itensComanda'] as List).map((itemComanda) => ItemComanda.fromJson(itemComanda)).toList();
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
}
