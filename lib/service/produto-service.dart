import 'dart:async';
import 'package:comanda/modal/Produto.dart';
import 'package:comanda/service/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdutoService {
  String url;

  ProdutoService() {
    this.url = Config.urlAplicacao + "/produtos/";
  }

  Future<Produto> buscarProduto(int id) async {
    try {
      final response = await http.get(this.url + '$id').timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        return Produto.fromJson(json.decode(Utf8Decoder().convert(response.bodyBytes)));
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }

  Future<List<Produto>> listarProdutos() async {
    try {
      final response = await http.get(this.url).timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        List<Produto> produtos = (json.decode(Utf8Decoder().convert(response.bodyBytes)) as List).map((produto) => Produto.fromJson(produto)).toList();
        return produtos;
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }
}
