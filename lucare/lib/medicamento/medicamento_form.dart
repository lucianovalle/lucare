import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:lucare/medicamento/medicamento_controller.dart';
import 'package:lucare/medicamento/model/medicamento.dart';
import 'package:lucare/services/medicamentos_service.dart';
import 'package:lucare/shared/components/botao.dart';
import 'package:lucare/shared/components/text_form.dart';
import 'package:lucare/shared/models/grandeza.dart';

class MedicamentoForm extends StatelessWidget {
  final DateFormat format = DateFormat('dd/MM/yyyy');
  final MedicamentoController controller = Modular.get<MedicamentoController>();

  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  MedicamentoForm({Key? key}) : super(key: key);

  void salvar() {
    //mas MedicamentosService service = MedicamentosService();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Medicamento medicamento = Medicamento();
    // medicamento.nome =  controller.medicamento.nome;
    // medicamento.grandeza = controller.medicamento.grandeza;
    // medicamento.quantidade = controller.medicamento.quantidade;
    // medicamento.utilizado = controller.medicamento.utilizado;
    // medicamento.descricao = medicamento.descricao;
    //medicamento.validade = controller.medicamento.validade;
    //service.incluirMedicamento(medicamento);

    //_formKey.currentState!.save();
    controller.salva();

    //Navigator.of(context).pop();
    Modular.to.pop();

    /*ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Medicamento salvo!')),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    //Object? medicamento = ModalRoute.of(context)!.settings.arguments;
    Medicamento? medicamento = Modular.args.data;

    if (medicamento != null) {
      controller.setMedicamento(medicamento);
      _formData['validade'] = format.format(medicamento.validade);
      _formData['grandeza'] = medicamento.grandeza.name;
      _formData['quantidade'] = medicamento.quantidade.toString();
    } else {
      controller.setMedicamento(Medicamento());
    }

    TextEditingController dateCtl =
        TextEditingController(text: _formData['validade']);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Medicamento"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              TextForm(
                valorInicial: controller.medicamento.nome,
                rotulo: 'Nome:',
                validacao: controller.validateVazio,
                salva: controller.medicamento.setNome,
              ),
              TextForm(
                valorInicial: controller.medicamento.principio,
                rotulo: 'Descrição:',
                validacao: controller.validateVazio,
                salva: controller.medicamento.setDescricao,
              ),
              TextForm(
                valorInicial: controller.medicamento.descricao,
                rotulo: 'Princípio ativo:',
                validacao: controller.validateVazio,
                salva: controller.medicamento.setPrincipio,
              ),
              TextFormField(
                controller: dateCtl,
                decoration: const InputDecoration(labelText: "Validade:"),
                onChanged: (value) => controller.medicamento.setValidade,
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2015),
                          lastDate: DateTime(2100))
                      .then((selectedDate) {
                    if (selectedDate != null) {
                      controller.medicamento.setValidade(selectedDate);
                      dateCtl.text = format.format(selectedDate);
                    }
                  });
                },
              ),
              TextForm(
                valorInicial: _formData['quantidade'],
                rotulo: 'Quantidade:',
                validacao: controller.validateVazio,
                salva: (value) => controller.parseInt(
                    value, controller.medicamento.setQuantidade),
              ),
              DropdownButtonFormField(
                value: _formData['grandeza'],
                decoration: const InputDecoration(labelText: "Grandeza:"),
                items: Grandeza.values
                    .map<DropdownMenuItem<String>>((Grandeza value) {
                  return DropdownMenuItem<String>(
                    value: value.name,
                    child: Text(value.name),
                  );
                }).toList(),
                onChanged: (value) => controller.medicamento.setGrandeza(
                    Grandeza.values
                        .firstWhere((element) => element.name == value)),
              ),
              TextForm(
                valorInicial: controller.medicamento.foto,
                rotulo: 'Foto:',
                salva: controller.medicamento.setFoto,
              ),
              const SizedBox(height: 15),
              FractionallySizedBox(
                widthFactor: 1, // means 100%, you can change this to 0.8 (80%)
                child: BotaoElevated(
                  rotulo: 'Salvar',
                  icone: Icons.save,
                  salva: salvar,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
