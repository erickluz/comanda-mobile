import 'package:comanda/service/comanda-service.dart';
import 'package:flutter/material.dart';
import 'package:comanda/home/controle-comandas/listagem/item-lista/box-comanda.dart';
import 'package:comanda/modal/comanda.dart';

class ListaComanda extends StatefulWidget {
  @override
  _ListaComandaState createState() => _ListaComandaState();
}

class _ListaComandaState extends State<ListaComanda>
    with AutomaticKeepAliveClientMixin<ListaComanda> {
  int _contador = 1;
  List<Widget> comandas = new List<Widget>();
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();

  void _adicionaComanda() {
    setState(() {
      _contador++;
      comandas.add(BoxComanda(
        numeroDaMesa: _contador,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    ComandaService servico = new ComandaService();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Buscar número da comanda/mesa',
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xf5f5f5f5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: FutureBuilder<List<Comanda>>(
                        future: servico.listaComanda(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Comanda>> snapshot) {
                          Widget filho;
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            comandas.clear();
                            if (snapshot.hasData) {
                              List<Comanda> comandasService = snapshot.data;
                              comandasService.forEach((comandaS) {
                                comandas.add(BoxComanda(
                                  numeroDaMesa: comandaS.numero,
                                ));
                              });
                              filho = GridView.count(
                                crossAxisCount: 2,
                                children: List.generate(this.comandas.length,
                                    (index) {
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
                                    child: Text(
                                        'Não foi possível carregar as comandas !!!'),
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
        onPressed: _adicionaComanda,
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
