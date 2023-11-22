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

  final MedicamentoController controller = Modular.get<MedicamentoController>();

  final TextEditingController _controllerNome = TextEditingController();

  final TextEditingController _controllerDescricao = TextEditingController();

  final TextEditingController _controllerPrincipio = TextEditingController();

  final TextEditingController _controllerQuantidade = TextEditingController();

  final TextEditingController _controllerData = TextEditingController();

  final TextEditingController _controllerFoto = TextEditingController();

  final _grandezaLista = ["COMPRIMIDO", "ML"];

  String? _grandezaSelecionada = "";

  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

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

    Medicamento medicamento = Medicamento();
    medicamento.nome = _controllerNome.value.text;
    Grandeza grandeza = Grandeza.values.byName(_grandezaSelecionada!);
    medicamento.grandeza = grandeza;
    medicamento.quantidade = int.parse(_controllerQuantidade.value.text);
    medicamento.principio = _controllerPrincipio.value.text;
    medicamento.descricao = _controllerDescricao.value.text;

    // String dateWithT =
    //     "${_controllerData.value.text.substring(6, 10)}-${_controllerData.value.text.substring(3, 5)}-${_controllerData.value.text.substring(0, 2)}T00:00:00.000000Z";
    // DateTime parseDate =
    //     DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(dateWithT);
    medicamento.validade = _controllerData.value.text;

    service.incluirMedicamento(medicamento);

    //_formKey.currentState!.save();
    //controller.salva();

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
      //_formData['validade'] = format.format(medicamento.validade);
      _formData['grandeza'] = medicamento.grandeza.name;
      _formData['quantidade'] = medicamento.quantidade.toString();
    } else {
      controller.setMedicamento(Medicamento());
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
                initialValue: medicamento?.nome,
                decoration: const InputDecoration(labelText: "Nome:"),
              ),
              TextFormField(
                controller: _controllerDescricao,
                initialValue: medicamento?.descricao,
                decoration: const InputDecoration(labelText: "Descrição:"),
              ),
              TextFormField(
                controller: _controllerPrincipio,
                initialValue: medicamento?.principio,
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
                initialValue: _formData['quantidade'],
                decoration: const InputDecoration(labelText: "Quantidade:"),
              ),
              DropdownButtonFormField(
                value: _formData['grandeza'],
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
                initialValue: medicamento?.foto,
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
