import 'package:lucare/shared/models/grandeza.dart';

class Medicamento {
  int id = 0;
  String nome = '';
  late DateTime validade;
  String descricao = '';
  int quantidade = 0;
  String foto = '';
  late Grandeza grandeza;
  late int utilizado;
  String principio = '';

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "quantidade": quantidade,
      "utilizado": utilizado,
      "vencimento": validade.toString(),
      "grandeza": grandeza.name,
      "principio": principio.toString(),
      "descricao": descricao.toString()
    };
  }

  void setId(int id) => this.id = id;

  void setNome(String nome) => this.nome = nome;

  void setValidade(DateTime validade) => this.validade = validade;

  void setDescricao(String descricao) => this.descricao = descricao;

  void setQuantidade(int quantidade) => this.quantidade = quantidade;

  void setUtilizado(int utilizado) => this.utilizado = utilizado;

  void setFoto(String foto) => this.foto = foto;

  void setGrandeza(Grandeza grandeza) => this.grandeza = grandeza;

  void setPrincipio(String principio) => this.principio = principio;
}
