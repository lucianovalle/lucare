import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';
import 'package:logger/logger.dart';
import 'package:lucare/medicamento/model/medicamento.dart';
import 'package:lucare/services/http_interceptors.dart';

class MedicamentosService {
  Logger logger = Logger();

  static const String url = "http://localhost:8080/medicamentos";
  //"http://ec2-3-21-129-50.us-east-2.compute.amazonaws.com:8080/medicamentos";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<bool> incluirMedicamento(Medicamento medicamento) async {
    String jsonMedicamento = json.encode(medicamento.toMap());
    logger.e(jsonMedicamento);
    http.Response resposta = await client.post(Uri.parse(url),
        body: jsonMedicamento, headers: {"Content-type": "application/json"});

    if (resposta.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<List<Medicamento>> consltarMedicamentos() async {
    final headers = {"Content-type": "application/json"};
    final response = await client.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List<Medicamento> lista = [];
      List<dynamic> listaDynamic = json.decode(utf8.decode(response.bodyBytes));
      for (var jsonMAp in listaDynamic) {
        lista.add(Medicamento.fromMap(jsonMAp));
      }

      return lista;
    } else {
      throw Exception('falhou na busca de medicamentos');
    }
  }
}
