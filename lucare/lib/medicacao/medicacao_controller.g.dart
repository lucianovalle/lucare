// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MediacaoController on _MediacaoController, Store {
  late final _$medicacaoAtom =
      Atom(name: '_MediacaoController.medicacao', context: context);

  @override
  Medicacao get medicacao {
    _$medicacaoAtom.reportRead();
    return super.medicacao;
  }

  @override
  set medicacao(Medicacao value) {
    _$medicacaoAtom.reportWrite(value, super.medicacao, () {
      super.medicacao = value;
    });
  }

  late final _$_MediacaoControllerActionController =
      ActionController(name: '_MediacaoController', context: context);

  @override
  void setMedicacao(Medicacao medicacao) {
    final _$actionInfo = _$_MediacaoControllerActionController.startAction(
        name: '_MediacaoController.setMedicacao');
    try {
      return super.setMedicacao(medicacao);
    } finally {
      _$_MediacaoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
medicacao: ${medicacao}
    ''';
  }
}
