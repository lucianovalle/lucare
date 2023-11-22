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

  Future<String> consltarMedicamentos() async {
    //http.Response response = await http.get(Uri.parse(url));
    // print(response.body.toString());
    //return response.body;

    final headers = {"Content-type": "application/json"};
    final response = await client.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return response.body;
      // return Materia.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
