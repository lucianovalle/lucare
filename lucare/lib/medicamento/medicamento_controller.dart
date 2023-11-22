import 'dart:math';

import 'package:lucare/medicamento/model/medicamento.dart';
import 'package:lucare/shared/models/grandeza.dart';
import 'package:mobx/mobx.dart';

part 'medicamento_controller.g.dart';

class MedicamentoController = _MedicamentoController
    with _$MedicamentoController;

abstract class _MedicamentoController with Store {
  @observable
  Medicamento medicamento = Medicamento();

  @observable
  ObservableList<Medicamento> medicamentos =
      ObservableList<Medicamento>().asObservable();

  _MedicamentoController() {
    consultaMedicamentos();
  }

  @action
  consultaMedicamentos() {
    var m1 = Medicamento();
    m1.setId(1);
    m1.setNome('Levotiroxina');
    //m1.setValidade(DateTime.now());
    m1.setPrincipio("");
    m1.setQuantidade(30);
    m1.setGrandeza(Grandeza.COMPRIMIDO);
    medicamentos.add(m1);

    var m2 = Medicamento();
    m2.setId(2);
    m2.setNome('Novalgina');
    //m2.setValidade(DateTime.now());
    m2.setPrincipio("");
    m2.setQuantidade(60);
    m2.setGrandeza(Grandeza.ML);
    medicamentos.add(m2);
  }

  @action
  salva() {
    if (medicamento.id != 0) {
      medicamentos.removeWhere((element) => element.id == medicamento.id);
    } else {
      medicamento.id = Random().nextInt(100);
    }

    medicamentos.add(medicamento);

    medicamento = Medicamento();
  }

  @action
  exclui(Medicamento medicamento) {
    medicamentos.removeWhere((element) => element.id == medicamento.id);
    medicamento = Medicamento();
  }

  @action
  void setMedicamento(Medicamento medicamento) =>
      this.medicamento = medicamento;

  String? validateVazio(String? nome) {
    if (nome == null || nome.isEmpty) {
      return "Campo Obrigatório";
    }

    return null;
  }

  void parseInt(String value, Function(int) set) => set(int.parse(value));

  @computed
  bool get valido {
    print('validando');
    return validateVazio(medicamento.nome) == null;
  }
}
