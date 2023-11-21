import 'package:flutter/material.dart';

class BotaoElevated extends StatelessWidget {
  String rotulo;
  IconData icone;
  void Function() salva;

  BotaoElevated(
      {Key? key,
      required this.rotulo,
      this.icone = Icons.save,
      required this.salva})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(icone),
        label: Text(rotulo),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          //fixedSize: const Size(200, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          textStyle: const TextStyle(fontSize: 18),
        ),
        onPressed: salva);
  }
}
