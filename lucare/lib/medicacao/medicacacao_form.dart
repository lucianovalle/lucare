import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:lucare/medicacao/medicacao_controller.dart';
import 'package:lucare/medicacao/model/medicacao.dart';
import 'package:lucare/shared/components/botao.dart';
import 'package:lucare/shared/components/text_form.dart';

class MedicacaoForm extends StatelessWidget {
  final DateFormat format = DateFormat('dd/MM/yyyy');

  final _formKey = GlobalKey<FormState>();

  MedicacaoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediacaoController controller = Modular.get<MediacaoController>();

    Medicacao? medicacao = Modular.args.data;
    if (medicacao != null) {
      controller.setMedicacao(medicacao);
    } else {
      controller.setMedicacao(Medicacao());
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            TextForm(
              valorInicial: controller.medicacao.medicamento.nome,
              rotulo: 'Medicamento',
            ),
            Row(
              children: [
                Expanded(
                  child: TextForm(
                    valorInicial: controller.medicacao.quantidade.toString(),
                    rotulo: 'Quantidade: (comprimidos)',
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: TextForm(
                    valorInicial: controller.medicacao.hora.toString(),
                    rotulo: 'A cada: (hora)',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextForm(
                    valorInicial: controller.medicacao.inicio.toString(),
                    rotulo: 'Início:',
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: TextForm(
                    valorInicial: controller.medicacao.inicio.toString(),
                    rotulo: 'Fim:',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            BotaoElevated(
              rotulo: 'Salvar',
              icone: Icons.save,
              salva: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
