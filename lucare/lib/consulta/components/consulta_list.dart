import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lucare/consulta/components/consulta_tile.dart';
import 'package:lucare/consulta/consulta_controller.dart';
import 'package:lucare/consulta/model/consulta.dart';
import 'package:lucare/shared/components/bar_item.dart';
import 'package:lucare/shared/routes/app_routes.dart';

class ConsultaList extends StatelessWidget {
  ConsultaList({Key? key}) : super(key: key);

  final ConsultaController controller = Modular.get<ConsultaController>();

  void selecionaPagina(int index) {
    Modular.to.pushNamed(AppRoutes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 228, 228),
      appBar: AppBar(
        title: const Text('Consultas'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Modular.to.pushNamed(AppRoutes.CONSULTA_FORM);
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: controller.consultas.length,
            itemBuilder: (ctx, i) => ConsultaTile(
                controller.consultas.elementAt(i), editar, excluir),
          );
        },
      ),
      bottomNavigationBar: const BarItem(),
    );
  }

  void editar(Consulta consulta) {
    Modular.to.pushNamed(AppRoutes.CONSULTA_FORM, arguments: consulta);
  }

  void excluir(Consulta consulta) => controller.exclui(consulta);
}
