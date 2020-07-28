import 'package:flutter/material.dart';

class InputTextForm extends StatelessWidget {
  final String label;
  final TextEditingController inputContorller;

  InputTextForm({Key key, this.label = "Nome", this.inputContorller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: inputContorller,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
