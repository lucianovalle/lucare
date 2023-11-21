import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lucare/medicamento/component/medicamento_tile.dart';
import 'package:lucare/medicamento/medicamento_controller.dart';
import 'package:lucare/medicamento/model/medicamento.dart';
import 'package:lucare/shared/components/bar_item.dart';
import 'package:lucare/shared/routes/app_routes.dart';

class MedicamentoList extends StatelessWidget {
  MedicamentoList({super.key});

  final MedicamentoController controller = Modular.get<MedicamentoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamentos'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              //Navigator.of(context).pushNamed(AppRoutes.MEDICAMENTO_FORM);
              //Modular.to.navigate(AppRoutes.MEDICAMENTO_FORM);
              Modular.to.pushNamed(AppRoutes.MEDICAMENTO_FORM);
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: controller.medicamentos.length,
            itemBuilder: (ctx, i) => MedicamentoTile(
                controller.medicamentos.elementAt(i), editar, excluir),
          );
        },
      ),
      bottomNavigationBar: const BarItem(),
    );
  }

  void editar(Medicamento medicamento) {
    Modular.to.pushNamed(AppRoutes.MEDICAMENTO_FORM, arguments: medicamento);
  }

  void excluir(Medicamento medicamento) => controller.exclui(medicamento);
}
