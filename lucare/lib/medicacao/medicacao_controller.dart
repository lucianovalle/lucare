import 'package:lucare/medicacao/model/medicacao.dart';
import 'package:mobx/mobx.dart';

part 'medicacao_controller.g.dart';

class MediacaoController = _MediacaoController with _$MediacaoController;

abstract class _MediacaoController with Store {
  @observable
  Medicacao medicacao = Medicacao();

  @action
  void setMedicacao(Medicacao medicacao) => this.medicacao = medicacao;

  void parseInt(String value, Function(int) set) => set(int.parse(value));
}
