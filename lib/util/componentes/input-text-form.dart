import 'package:flutter/material.dart';

class InputTextForm extends StatelessWidget {
  final String label;

  InputTextForm({Key key, this.label = "Nome"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
