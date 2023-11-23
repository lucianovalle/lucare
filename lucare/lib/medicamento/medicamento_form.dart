import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:lucare/medicamento/medicamento_controller.dart';
import 'package:lucare/medicamento/model/medicamento.dart';
import 'package:lucare/services/medicamentos_service.dart';
import 'package:lucare/shared/components/botao.dart';
import 'package:lucare/shared/models/grandeza.dart';

class MedicamentoForm extends StatefulWidget {
  MedicamentoForm({Key? key}) : super(key: key);

  @override
  State<MedicamentoForm> createState() => _MedicamentoFormState();
}

class _MedicamentoFormState extends State<MedicamentoForm> {
  final DateFormat format = DateFormat('dd/MM/yyyy');

  MedicamentoController controller = Modular.get<MedicamentoController>();

  TextEditingController _controllerNome = TextEditingController();

  TextEditingController _controllerDescricao = TextEditingController();

  TextEditingController _controllerPrincipio = TextEditingController();

  TextEditingController _controllerQuantidade = TextEditingController();

  TextEditingController _controllerData = TextEditingController();

  TextEditingController _controllerFoto = TextEditingController();

  final _grandezaLista = ["COMPRIMIDO", "ML"];

  String? _grandezaSelecionada = "";

  final _formKey = GlobalKey<FormState>();

  Medicamento medicamento = Medicamento.empty();

  @override
  void dispose() {
    _controllerData.dispose();
    super.dispose();
  }

  void salvar() {
    MedicamentosService service = MedicamentosService();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    Medicamento medicamento = Medicamento.empty();
    medicamento.nome = _controllerNome.value.text;
    Grandeza grandeza = Grandeza.values.byName(_grandezaSelecionada!);
    medicamento.grandeza = grandeza;
    medicamento.quantidade = int.parse(_controllerQuantidade.value.text);
    medicamento.principio = _controllerPrincipio.value.text;
    medicamento.descricao = _controllerDescricao.value.text;
    medicamento.validade = _controllerData.value.text;

    if (Modular.args.data != null) {
      Medicamento medicamentoID = Modular.args.data;
      medicamento.id = medicamentoID.id;
      service.atualizar(medicamento);
    } else {
      service.incluirMedicamento(medicamento);
    }
    Modular.to.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (Modular.args.data != null) {
      medicamento = Modular.args.data;
      controller.setMedicamento(medicamento);
      _controllerNome = TextEditingController(text: medicamento.nome);
      _controllerQuantidade =
          TextEditingController(text: medicamento.quantidade.toString());
      _controllerPrincipio = TextEditingController(text: medicamento.principio);
      _controllerQuantidade =
          TextEditingController(text: medicamento.quantidade.toString());
      _controllerData = TextEditingController(text: medicamento.validade);
      _controllerFoto = TextEditingController(text: medicamento.foto);
      _controllerDescricao = TextEditingController(text: medicamento.descricao);

      _grandezaSelecionada = medicamento.grandeza.name;
    } else {
      controller.setMedicamento(Medicamento.empty());
    }

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
              TextFormField(
                controller: _controllerNome,
                decoration: const InputDecoration(labelText: "Nome:"),
              ),
              TextFormField(
                controller: _controllerDescricao,
                decoration: const InputDecoration(labelText: "Descrição:"),
              ),
              TextFormField(
                controller: _controllerPrincipio,
                decoration:
                    const InputDecoration(labelText: "Princípio ativo:"),
              ),
              TextFormField(
                controller: _controllerData,
                decoration: const InputDecoration(labelText: "Validade:"),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    _controllerData.text = format.format(date);
                  }
                },
              ),
              TextFormField(
                controller: _controllerQuantidade,
                decoration: const InputDecoration(labelText: "Quantidade:"),
              ),
              DropdownButtonFormField(
                value: _grandezaSelecionada,
                decoration: const InputDecoration(labelText: "Grandeza:"),
                items: _grandezaLista
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _grandezaSelecionada = val as String;
                  });
                },
              ),
              TextFormField(
                controller: _controllerFoto,
                decoration: const InputDecoration(labelText: "Foto:"),
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
