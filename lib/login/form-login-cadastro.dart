import 'package:flutter/material.dart';

class LoginCadastro extends StatefulWidget {
  @override
  _LoginCadastroState createState() => _LoginCadastroState();
}

class _LoginCadastroState extends State<LoginCadastro> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TextFormField(validator: (value){
              if (value.isEmpty){
                return "Insira seu e-mail aqui";
              }
              return null;
            },),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TextFormField(validator: (value){
              if (value.isEmpty){
                return "Insira sua senha aqui";
              }
              return null;
            },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: RaisedButton.icon(onPressed: () {
              if (_formKey.currentState.validate()){
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Processando dados.."),));
                // Valida com o servidor
                // Navega para o Bootstrap
              }
            }, icon: Icon(Icons.check_circle), label: Text("Confirmar"))
            ),
        ],
      ),
    );
  }
}
