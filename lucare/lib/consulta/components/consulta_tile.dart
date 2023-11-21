import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucare/consulta/model/consulta.dart';

class ConsultaTile extends StatelessWidget {
  final Consulta consulta;
  final Function(Consulta medicamento) editar;
  final Function(Consulta medicamento) excluir;

  const ConsultaTile(this.consulta, this.editar, this.excluir, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('dd/MM/yyyy');

    return ListTile(
      title: Text(
          '${consulta.especialidade} - ${format.format(consulta.data)} as ${consulta.hora}'),
      subtitle: Text('Local: ${consulta.local}\nMedico:  ${consulta.medico}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.orange,
            onPressed: () {
              editar(consulta);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              excluir(consulta);
            },
          )
        ],
      ),
    );
  }
}
