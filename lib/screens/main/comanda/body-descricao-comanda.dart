import 'package:comanda/util/componentes/input-text-form.dart';
import 'package:comanda/util/componentes/label.dart';
import 'package:flutter/material.dart';

class BodyDescricaoComanda extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeClienteController;
  BodyDescricaoComanda({Key key, this.nomeClienteController});

  @override
  Widget build(BuildContext context) {
    String horarioAbertura = "19:22";
    String horarioFechamento = "--:--";
    return Column(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        LabelTexto(texto: "Abertura comanda: "),
                        LabelTexto(texto: horarioAbertura),
                      ],
                    ),
                    Row(
                      children: [
                        LabelTexto(texto: "Fechamento comanda: "),
                        LabelTexto(texto: horarioFechamento),
                      ],
                    ),
                    InputTextForm(
                      inputContorller: nomeClienteController,
                      label: "Nome do cliente",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
