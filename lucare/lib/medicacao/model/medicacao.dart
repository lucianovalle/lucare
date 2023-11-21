import 'package:lucare/consulta/model/consulta.dart';
import 'package:lucare/medicamento/model/medicamento.dart';

class Medicacao {
  int id = 0;
  Consulta consulta = Consulta();
  Medicamento medicamento = Medicamento();
  DateTime inicio = DateTime.now();
  int quantidade = 0;
  int hora = 0;

  void setId(int id) => this.id = id;

  void setConsulta(Consulta consulta) => this.consulta = consulta;

  void setMedicamento(Medicamento medicamento) =>
      this.medicamento = medicamento;

  void setInicio(DateTime inicio) => this.inicio = inicio;

  void setQuantidade(int quantidade) => this.quantidade = quantidade;

  void setHora(int hora) => this.hora = hora;
}
