import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucare/medicamento/model/medicamento.dart';

class MedicamentoTile extends StatelessWidget {
  final Medicamento medicamento;
  final Function(Medicamento medicamento) editar;
  final Function(Medicamento medicamento) excluir;

  const MedicamentoTile(this.medicamento, this.editar, this.excluir, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foto = medicamento.foto == '' || medicamento.foto.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(medicamento.foto));

    var format = DateFormat('dd/MM/yyyy');

    return Card(
      child: ListTile(
        leading: foto,
        isThreeLine: true,
        title: Text(medicamento.nome),
        subtitle: Text(
            'Princípio ativo: ${medicamento.principio}\nValidade:  ${medicamento.validade} \nQuantidade: ${medicamento.quantidade} - ${medicamento.grandeza.name}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                //Navigator.of(context).pushNamed(AppRoutes.MEDICAMENTO_FORM, arguments: medicamento);
                editar(medicamento);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                excluir(medicamento);
              },
            )
          ],
        ),
      ),
    );
  }
}
