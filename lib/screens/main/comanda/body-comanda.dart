import 'dart:async';

import 'package:comanda/modal/Comanda.dart';
import 'package:comanda/modal/ItemComanda.dart';
import 'package:comanda/modal/Produto.dart';
import 'package:comanda/screens/main/comanda/body-descricao-comanda.dart';
import 'package:comanda/screens/main/comanda/body-detalhe-item-produto.dart';
import 'package:comanda/screens/main/comanda/body-listagem-de-itens-comanda.dart';
import 'package:comanda/screens/main/comanda/body-selecao-de-produtos.dart';
import 'package:comanda/screens/main/comanda/components/item-de-comanda.dart';
import 'package:comanda/service/comanda-service.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

class BodyComanda extends StatefulWidget {
  final int numeroComanda;
  BodyComanda({this.numeroComanda});

  @override
  BodyComandaState createState() => BodyComandaState(numeroComanda: numeroComanda);
}

class BodyComandaState extends State<BodyComanda> with AutomaticKeepAliveClientMixin<BodyComanda> {
  final numeroComanda;
  BodyComandaState({this.numeroComanda});
  List<ComponenteItemComanda> cItensComanda = new List<ComponenteItemComanda>();
  Produto produto;
  double valorTotalComanda = 0;
  ComandaService comandaService = new ComandaService();
  Future<Comanda> comandaServidor;
  Comanda minhaComanda;
  int count = 0;
  TextEditingController nomeClienteController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (this.numeroComanda != null) {
      this.comandaServidor = comandaService.buscarComanda(this.numeroComanda);
    } else {
      List<ItemComanda> itensComanda = new List<ItemComanda>();
      this.comandaServidor = Future<Comanda>.value(new Comanda(itensComanda: itensComanda, valorTotal: 0.0));
    }
  }

  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Insira o número da mesa/comanda"),
            content: TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              controller: customController,
            ),
            actions: [
              MaterialButton(
                elevation: 5.0,
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop(null);
                },
                color: Colors.grey,
              ),
              MaterialButton(
                elevation: 5.0,
                child: Text("Confirmar"),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
                color: Colors.green,
              )
            ],
          );
        });
  }

  void selecionarProduto(Produto produto) {
    setState(() {
      minhaComanda.adicionarNumeroItemComanda(produto);
      comandaServidor = Future<Comanda>.value(minhaComanda);
      Navigator.pop(context);
    });
  }

  void alterarQuantidadeItem(Produto produto, int quantidade) {
    setState(() {
      minhaComanda.alterarQuantidadeItemComanda(produto, quantidade);
      comandaServidor = Future<Comanda>.value(minhaComanda);
    });
  }

  void removerItemComanda(int idProduto) {
    for (int i = 0; i < minhaComanda.itensComanda.length; i++) {
      if (minhaComanda.itensComanda[i].produto.id == idProduto) {
        minhaComanda.itensComanda.removeAt(i);
        break;
      }
    }
  }

  void selecionarItemDeComanda(Produto produto, int quantidade) {
    count = quantidade;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: MediaQuery.of(context).size.height * .30,
                child: DetalheItemProduto(
                    produto: produto,
                    quantidade: count,
                    onCountChange: (int val) {
                      setState(() {
                        count += val;
                      });
                    }),
              );
            },
          );
        }).then((void value) {
      alterarQuantidadeItem(produto, count);
    });
  }

  void salvarComanda() {
    if (minhaComanda.numero != null) {
      minhaComanda.nomeCliente = nomeClienteController.text;
      print(minhaComanda.nomeCliente);
      comandaService.editarComanda(minhaComanda).then((value) {
        BotToast.showText(text: "Comanda salva com sucesso !");
        Navigator.pop(context);
      }).catchError((Object error) {
        BotToast.showText(text: "Erro ao salvar comanda");
      });
    } else {
      createAlertDialog(context).then((String numeroComanda) {
        if (numeroComanda != null) {
          minhaComanda.nomeCliente = nomeClienteController.text;
          print(minhaComanda.nomeCliente);
          minhaComanda.numero = int.parse(numeroComanda);
          comandaService.salvarComanda(minhaComanda).then((value) {
            BotToast.showText(text: "Comanda salva com sucesso !");
            Navigator.pop(context);
          }).catchError((Object onError) {
            BotToast.showText(text: "Erro ao criar comanda !");
          });
        }
      });
    }
  }

  void adicionarItemNaComanda() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * .80,
            child: SelecaoProdutos(
              selecionarProduto: selecionarProduto,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Itens da comanda",
                ),
                Tab(
                  text: "Detalhes",
                )
              ],
            ),
            title: Text("Comanda"),
            actions: [
              Icon(Icons.print),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {},
              ),
            ],
          ),
          body: FutureBuilder<Comanda>(
              future: comandaServidor,
              builder: (BuildContext context, AsyncSnapshot<Comanda> snapshot) {
                Widget filho;
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    Comanda comandaDoServidor = snapshot.data;
                    minhaComanda = comandaDoServidor;
                    nomeClienteController.text = minhaComanda.nomeCliente;
                    cItensComanda.clear();
                    comandaDoServidor.itensComanda.forEach((comanda) {
                      cItensComanda.add(new ComponenteItemComanda(
                        produto: comanda.produto,
                        quantidade: comanda.quantidade,
                        selecionarItemComanda: selecionarItemDeComanda,
                        removerItemComanda: removerItemComanda,
                      ));
                    });

                    filho = TabBarView(
                      children: [
                        BodyListagemItensComanda(
                          itensComanda: cItensComanda,
                          adicionaItemComanda: adicionarItemNaComanda,
                          salvarComanda: salvarComanda,
                          comanda: comandaDoServidor,
                        ),
                        BodyDescricaoComanda(
                          nomeClienteController: nomeClienteController,
                        )
                      ],
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
                          child: Text('Não foi possível carregar a comanda !!!'),
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
                        child: Text('Carregando comanda...'),
                      )
                    ],
                  );
                }
                return Center(child: filho);
              }),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
