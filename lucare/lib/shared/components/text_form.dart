import 'package:flutter/material.dart'
    show
        BuildContext,
        InputDecoration,
        Key,
        StatelessWidget,
        TextFormField,
        Widget;

class TextForm extends StatelessWidget {
  String? valorInicial;
  final String rotulo;
  final Function(String)? validacao;
  final void Function(String) salva;

  TextForm({
    Key? key,
    this.valorInicial,
    this.rotulo = '',
    this.validacao = _valida,
    this.salva = _salva,
  }) : super(key: key);

  static String? _valida(String value) => null;
  static void _salva(String value) {}

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: valorInicial,
      decoration: InputDecoration(labelText: rotulo),
      validator: (value) {
        return validacao!(value!);
      },
      onSaved: (value) {
        salva(value!);
      },
    );
  }
}
