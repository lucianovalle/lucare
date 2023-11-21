// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConsultaController on _ConsultaController, Store {
  late final _$consultaAtom =
      Atom(name: '_ConsultaController.consulta', context: context);

  @override
  Consulta get consulta {
    _$consultaAtom.reportRead();
    return super.consulta;
  }

  @override
  set consulta(Consulta value) {
    _$consultaAtom.reportWrite(value, super.consulta, () {
      super.consulta = value;
    });
  }

  late final _$consultasAtom =
      Atom(name: '_ConsultaController.consultas', context: context);

  @override
  ObservableList<Consulta> get consultas {
    _$consultasAtom.reportRead();
    return super.consultas;
  }

  @override
  set consultas(ObservableList<Consulta> value) {
    _$consultasAtom.reportWrite(value, super.consultas, () {
      super.consultas = value;
    });
  }

  late final _$_ConsultaControllerActionController =
      ActionController(name: '_ConsultaController', context: context);

  @override
  dynamic consultaConsultar() {
    final _$actionInfo = _$_ConsultaControllerActionController.startAction(
        name: '_ConsultaController.consultaConsultar');
    try {
      return super.consultaConsultar();
    } finally {
      _$_ConsultaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic salva() {
    final _$actionInfo = _$_ConsultaControllerActionController.startAction(
        name: '_ConsultaController.salva');
    try {
      return super.salva();
    } finally {
      _$_ConsultaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic exclui(Consulta consulta) {
    final _$actionInfo = _$_ConsultaControllerActionController.startAction(
        name: '_ConsultaController.exclui');
    try {
      return super.exclui(consulta);
    } finally {
      _$_ConsultaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConsulta(Consulta consulta) {
    final _$actionInfo = _$_ConsultaControllerActionController.startAction(
        name: '_ConsultaController.setConsulta');
    try {
      return super.setConsulta(consulta);
    } finally {
      _$_ConsultaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
consulta: ${consulta},
consultas: ${consultas}
    ''';
  }
}
