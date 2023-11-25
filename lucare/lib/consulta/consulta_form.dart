import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:lucare/consulta/consulta_controller.dart';
import 'package:lucare/consulta/model/consulta.dart';
import 'package:lucare/medicacao/medicacacao_form.dart';
import 'package:lucare/shared/components/botao.dart';
import 'package:lucare/shared/components/text_form.dart';

class ConsultaForm extends StatelessWidget {
  final DateFormat formatData = DateFormat('dd/MM/yyyy');

  final _formKey = GlobalKey<FormState>();

  ConsultaForm({Key? key}) : super(key: key);

  formataHora(TimeOfDay hora) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, hora.hour, hora.minute);
    final format = DateFormat("HH:mm");
    return format.format(dt);
  }

  Future<void> _adiconaMedicacao(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Medicacao'),
            children: <Widget>[
              MedicacaoForm(),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final ConsultaController controller = Modular.get<ConsultaController>();

    Consulta? consulta = Modular.args.data;
    if (consulta != null) {
      controller.setConsulta(consulta);
    } else {
      controller.setConsulta(Consulta());
    }

    TextEditingController dateCtl = TextEditingController(
        text: formatData.format(controller.consulta.data));
    TextEditingController horaCtl =
        TextEditingController(text: formataHora(controller.consulta.hora));

    var renderOverlay = true;
    var useRAnimation = true;
    var isDialOpen = ValueNotifier<bool>(false);
    var buttonSize = const Size(56.0, 56.0);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 228, 228),
      appBar: AppBar(
        title: const Text("Consulta"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        buttonSize: buttonSize,
        visible: true,
        direction: SpeedDialDirection.up,
        switchLabelPosition: false,
        closeManually: false,
        renderOverlay: renderOverlay,
        onOpen: () => debugPrint('OPENING DIAL'),
        onClose: () => debugPrint('DIAL CLOSED'),
        useRotationAnimation: useRAnimation,
        tooltip: 'Open Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        // foregroundColor: Colors.black,
        // backgroundColor: Colors.white,
        // activeForegroundColor: Colors.red,
        // activeBackgroundColor: Colors.blue,
        elevation: 8.0,
        isOpenOnStart: false,
        animationDuration: const Duration(milliseconds: 200),
        shape: const StadiumBorder(),
        // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add),
            label: 'Medicação',
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            onTap: () => _adiconaMedicacao(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextForm(
                valorInicial: controller.consulta.especialidade,
                rotulo: 'Especialidade:',
                validacao: controller.validateVazio,
                salva: controller.consulta.setEspecialidade,
              ),
              TextForm(
                valorInicial: controller.consulta.medico,
                rotulo: 'Medico:',
                validacao: controller.validateVazio,
                salva: controller.consulta.setMedico,
              ),
              TextForm(
                valorInicial: controller.consulta.local,
                rotulo: 'Local:',
                validacao: controller.validateVazio,
                salva: controller.consulta.setLocal,
              ),
              TextFormField(
                controller: dateCtl,
                decoration: const InputDecoration(labelText: "Dia:"),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2015),
                          lastDate: DateTime(2100))
                      .then((selectedDate) {
                    if (selectedDate != null) {
                      controller.consulta.setData(selectedDate);
                      dateCtl.text = formatData.format(selectedDate);
                    }
                  });
                },
              ),
              TextFormField(
                controller: horaCtl,
                decoration: const InputDecoration(labelText: "Hora:"),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (BuildContext context, Widget? child) {
                        return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: true),
                          child: child!,
                        );
                      }).then((hora) {
                    if (hora != null) {
                      controller.consulta.setHora(hora);
                      horaCtl.text = formataHora(hora);
                    }
                  });
                },
              ),
              const SizedBox(height: 15),
              FractionallySizedBox(
                widthFactor: 1,
                child: BotaoElevated(
                  rotulo: 'Salvar',
                  icone: Icons.save,
                  salva: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState!.save();
                    controller.salva();

                    Modular.to.pop();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Consulta salva!')),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
