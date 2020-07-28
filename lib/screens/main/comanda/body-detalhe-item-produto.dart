import 'package:comanda/modal/Produto.dart';
import 'package:comanda/screens/main/comanda/components/item-de-comanda.dart';
import 'package:comanda/util/componentes/botao-redondo.dart';
import 'package:flutter/material.dart';

class DetalheItemProduto extends StatelessWidget {
  final Produto produto;
  final int quantidade;
  final Function(int) onCountChange;
  DetalheItemProduto({Key key, @required this.produto, this.quantidade, this.onCountChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ComponenteItemComanda(
          produto: produto,
          quantidade: quantidade,
        ),
        Row(
          children: [
            Expanded(
              child: BotaoRedondo(
                cor: Colors.green,
                icone: Icons.add,
                metodo: () => onCountChange(1),
              ),
            ),
            Expanded(
              child: Center(
                  child: Text(
                "$quantidade",
                style: TextStyle(color: Colors.black, fontSize: 40),
              )),
            ),
            Expanded(
              child: BotaoRedondo(
                cor: Colors.red,
                icone: Icons.remove,
                metodo: () => onCountChange(-1),
              ),
            ),
          ],
        )
      ],
    );
  }
}
