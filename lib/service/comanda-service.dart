import 'dart:async';

import 'package:comanda/modal/Comanda.dart';
import 'package:comanda/service/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComandaService {
  String url;

  ComandaService() {
    this.url = Config.urlAplicacao + "/comandas/";
  }

  Future<Comanda> buscaComanda(int id) {
    return _buscaComanda(id, this.url);
  }

  Future<Comanda> buscaComandaCompleta(int id) {
    return _buscaComanda(id, this.url + '/');
  }

  Future<Comanda> _buscaComanda(int id, String url) async {
    try {
      final response = await http
          .get(url + '$id')
          .timeout(Duration(seconds: Config.timeoutPadrao));
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return Comanda.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }

  Future<List<Comanda>> listaComanda() async {
    try {
      final response = await http
          .get(this.url)
          .timeout(Duration(seconds: Config.timeoutPadrao));
      if (response.statusCode == 200) {
        return (json.decode(response.body) as List)
            .map((comanda) => Comanda.fromJson(comanda))
            .toList();
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }
}
