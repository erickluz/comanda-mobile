import 'package:comanda/util/util.dart';
import 'package:flutter/material.dart';
import 'package:comanda/modal/Produto.dart';

class ItemListaProduto extends StatelessWidget {
  final Produto produto;
  final Function(Produto produto) selecionaProduto;

  ItemListaProduto({@required this.produto, this.selecionaProduto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        shadowColor: Colors.black,
        elevation: 10.0,
        borderOnForeground: true,
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            selecionaProduto(this.produto);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  height: 80,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 5,
                        left: 10,
                        child: Text(
                          this.produto.nome,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 10,
                        child: Container(
                            child: Text(
                          "Preço: " + Util.formataDinheiro(this.produto.preco),
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.start,
                        )),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    width: double.infinity,
                    height: 80.0,
                    child: Container(
                        width: 20,
                        height: 20,
                        child: Container(
                          color: Colors.white,
                          child: Image.asset(
                            "assets/hamburguer_drink.png",
                            fit: BoxFit.cover,
                          ),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
