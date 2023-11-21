import 'package:flutter/material.dart';

class Consulta {
  int id = 0;
  DateTime data = DateTime.now();
  TimeOfDay hora = TimeOfDay.now();
  String medico = '';
  String especialidade = '';
  String local = '';

  void setId(int id) => this.id = id;

  void setData(DateTime data) => this.data = data;

  void setHora(TimeOfDay hora) => this.hora = hora;

  void setMedico(String medico) => this.medico = medico;

  void setEspecialidade(String especialidade) =>
      this.especialidade = especialidade;

  void setLocal(String local) => this.local = local;
}
