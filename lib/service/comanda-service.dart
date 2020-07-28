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

  Future<Comanda> buscarComanda(int id) {
    return _buscarComanda(id, this.url);
  }

  Future<Comanda> _buscarComanda(int id, String url) async {
    try {
      final response = await http.get(url + '$id').timeout(Duration(seconds: Config.timeoutPadrao));
      if (response.statusCode == 200) {
        return Comanda.fromJson(json.decode(Utf8Decoder().convert(response.bodyBytes)));
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }

  Future<List<Comanda>> listarComandas() async {
    try {
      final response = await http.get(this.url).timeout(Duration(seconds: Config.timeoutPadrao));
      if (response.statusCode == 200) {
        return (json.decode(Utf8Decoder().convert(response.bodyBytes)) as List).map((comanda) => Comanda.fromJson(comanda)).toList();
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }

  Future<bool> editarComanda(Comanda comanda) async {
    try {
      String entidade = jsonEncode(comanda.toJson());
      final response = await http.put(this.url, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'}, body: entidade);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception {
      return false;
    }
  }

  Future<bool> salvarComanda(Comanda comanda) async {
    try {
      String entidade = jsonEncode(comanda.toJson());
      final response = await http.post(this.url, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'}, body: entidade);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception {
      return false;
    }
  }
}
