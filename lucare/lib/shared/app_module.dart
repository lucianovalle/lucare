import 'package:flutter_modular/flutter_modular.dart';
import 'package:lucare/consulta/components/consulta_list.dart';
import 'package:lucare/consulta/consulta_controller.dart';
import 'package:lucare/consulta/consulta_form.dart';
import 'package:lucare/medicacao/medicacacao_form.dart';
import 'package:lucare/medicacao/medicacao_controller.dart';
import 'package:lucare/medicamento/component/medicamento_list.dart';
import 'package:lucare/medicamento/medicamento_controller.dart';
import 'package:lucare/medicamento/medicamento_form.dart';
import 'package:lucare/shared/routes/app_routes.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(MedicamentoController.new);
    i.addLazySingleton(ConsultaController.new);
    i.addLazySingleton(MediacaoController.new);
  }

  @override
  void exportedBinds(i) {
    i.add(MedicamentoController.new);
    i.add(ConsultaController.new);
    i.add(MediacaoController.new);
  }

  @override
  void routes(r) {
    r.child(AppRoutes.HOME, child: (context) => MedicamentoList());
    r.child(AppRoutes.MEDICAMENTO_FORM, child: (context) => MedicamentoForm());
    r.child(AppRoutes.CONSULTA_LISTA, child: (context) => ConsultaList());
    r.child(AppRoutes.CONSULTA_FORM, child: (context) => ConsultaForm());
    r.child(AppRoutes.MEDICACAO_FORM, child: (context) => MedicacaoForm());
  }
}
