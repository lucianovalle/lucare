// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicamento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MedicamentoController on _MedicamentoController, Store {
  Computed<bool>? _$validoComputed;

  @override
  bool get valido => (_$validoComputed ??= Computed<bool>(() => super.valido,
          name: '_MedicamentoController.valido'))
      .value;

  late final _$medicamentoAtom =
      Atom(name: '_MedicamentoController.medicamento', context: context);

  @override
  Medicamento get medicamento {
    _$medicamentoAtom.reportRead();
    return super.medicamento;
  }

  @override
  set medicamento(Medicamento value) {
    _$medicamentoAtom.reportWrite(value, super.medicamento, () {
      super.medicamento = value;
    });
  }

  late final _$medicamentosAtom =
      Atom(name: '_MedicamentoController.medicamentos', context: context);

  @override
  ObservableList<Medicamento> get medicamentos {
    _$medicamentosAtom.reportRead();
    return super.medicamentos;
  }

  @override
  set medicamentos(ObservableList<Medicamento> value) {
    _$medicamentosAtom.reportWrite(value, super.medicamentos, () {
      super.medicamentos = value;
    });
  }

  late final _$_MedicamentoControllerActionController =
      ActionController(name: '_MedicamentoController', context: context);

  @override
  dynamic consultaMedicamentos() {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction(
        name: '_MedicamentoController.consultaMedicamentos');
    try {
      return super.consultaMedicamentos();
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic salva() {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction(
        name: '_MedicamentoController.salva');
    try {
      return super.salva();
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic exclui(Medicamento medicamento) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction(
        name: '_MedicamentoController.exclui');
    try {
      return super.exclui(medicamento);
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMedicamento(Medicamento medicamento) {
    final _$actionInfo = _$_MedicamentoControllerActionController.startAction(
        name: '_MedicamentoController.setMedicamento');
    try {
      return super.setMedicamento(medicamento);
    } finally {
      _$_MedicamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medicamento: ${medicamento},
medicamentos: ${medicamentos},
valido: ${valido}
    ''';
  }
}
