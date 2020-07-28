import 'dart:async';

import 'package:comanda/screens/main/comanda/body-comanda.dart';
import 'package:comanda/screens/main/comanda/components/card-comanda.dart';
import 'package:comanda/service/comanda-service.dart';
import 'package:flutter/material.dart';
import 'package:comanda/modal/Comanda.dart';

class BodyListagemComandas extends StatefulWidget {
  @override
  _BodyListagemComandas createState() => _BodyListagemComandas();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _BodyListagemComandas extends State<BodyListagemComandas> with AutomaticKeepAliveClientMixin<BodyListagemComandas> {
  List<Widget> comandas = new List<Widget>();
  Future<List<Comanda>> comandasFiltradas;
  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
  final _debouncer = Debouncer(milliseconds: 500);
  ComandaService comandaService = new ComandaService();
  List<Comanda> minhasComandas = new List<Comanda>();
  final buscaComandaController = TextEditingController();
  void _listarComandas() {
    setState(() {
      comandasFiltradas = comandaService.listarComandas();
      comandasFiltradas.then((List<Comanda> comandas) {
        minhasComandas = comandas;
      });
      buscaComandaController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    comandasFiltradas = comandaService.listarComandas();
    comandasFiltradas.then((List<Comanda> comandas) {
      minhasComandas = comandas;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Comanda> comandasFuture = new List<Comanda>();
    return Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                controller: buscaComandaController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Buscar número da comanda/mesa',
                ),
                autofocus: false,
                onChanged: (string) {
                  _debouncer.run(() {
                    setState(() {
                      comandasFiltradas = Future<List<Comanda>>.value(minhasComandas.where((c) => c.numero.toString().contains(string.toLowerCase())).toList());
                    });
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xf5f5f5f5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: FutureBuilder<List<Comanda>>(
                          future: comandasFiltradas,
                          builder: (BuildContext context, AsyncSnapshot<List<Comanda>> snapshot) {
                            Widget filho;
                            if (snapshot.connectionState == ConnectionState.done) {
                              comandas.clear();
                              if (snapshot.hasData) {
                                comandasFuture = snapshot.data;
                                comandasFuture.forEach((comandaS) {
                                  comandas.add(CardComanda(
                                    comanda: comandaS,
                                    listarComandas: _listarComandas,
                                  ));
                                });
                                filho = GridView.count(
                                  crossAxisCount: 2,
                                  children: List.generate(this.comandas.length, (index) {
                                    return Center(
                                      child: this.comandas[index],
                                    );
                                  }),
                                );
                              } else {
                                filho = Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.sentiment_dissatisfied,
                                      color: Colors.grey,
                                      size: 90,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Text('Não foi possível carregar as comandas !!!'),
                                    )
                                  ],
                                );
                              }
                            } else {
                              filho = Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: CircularProgressIndicator(),
                                    width: 60,
                                    height: 60,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 16),
                                    child: Text('Carregando comandas...'),
                                  )
                                ],
                              );
                            }
                            return Center(child: filho);
                          })),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BodyComanda(numeroComanda: null))).then((value) {
                _listarComandas();
              });
            },
            child: Icon(Icons.add)));
  }

  @override
  bool get wantKeepAlive => true;
}
