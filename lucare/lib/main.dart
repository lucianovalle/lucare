import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lucare/medicamento/model/medicamento.dart';
import 'package:lucare/services/medicamentos_service.dart';
import 'package:lucare/shared/app_module.dart';
import 'package:lucare/shared/models/grandeza.dart';

void main() {
  MedicamentosService service = MedicamentosService();
  service.consltarMedicamentos();
  Medicamento medicamento = Medicamento();
  medicamento.nome = "teste ee";
  medicamento.grandeza = Grandeza.COMPRIMIDO;
  medicamento.quantidade = 33;
  medicamento.utilizado = 15;
  medicamento.descricao = "Utilizado";
  medicamento.validade = "10/12/2025"; //DateTime.now()"";
  service.incluirMedicamento(medicamento);

  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
