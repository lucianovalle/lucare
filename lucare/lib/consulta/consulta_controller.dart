import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lucare/consulta/model/consulta.dart';
import 'package:mobx/mobx.dart';

part 'consulta_controller.g.dart';

class ConsultaController = _ConsultaController with _$ConsultaController;

abstract class _ConsultaController with Store {
  @observable
  Consulta consulta = Consulta();

  @observable
  ObservableList<Consulta> consultas =
      ObservableList<Consulta>().asObservable();

  _ConsultaController() {
    consultaConsultar();
  }

  @action
  consultaConsultar() {
    var c = Consulta();
    c.setId(1);
    c.setData(DateTime.now());
    c.setEspecialidade("Endocrinologia");
    c.setLocal("SQS 715 bloco c Sala 202");
    c.setMedico("Dr.João Mesquita");
    c.setHora(const TimeOfDay(hour: 17, minute: 30));
    consultas.add(c);
  }

  @action
  salva() {
    if (consulta.id != 0) {
      consultas.removeWhere((element) => element.id == consulta.id);
    } else {
      consulta.id = Random().nextInt(100);
    }

    consultas.add(consulta);

    consulta = Consulta();
  }

  @action
  exclui(Consulta consulta) {
    consultas.removeWhere((element) => element.id == consulta.id);
    consulta = Consulta();
  }

  @action
  void setConsulta(Consulta consulta) => this.consulta = consulta;

  String? validateVazio(String? nome) {
    if (nome == null || nome.isEmpty) {
      return "Campo Obrigatório";
    }

    return null;
  }

  void parseInt(String value, Function(int) set) => set(int.parse(value));
}
