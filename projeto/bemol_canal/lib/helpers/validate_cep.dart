import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map?> validateCep({required String cep}) async {
  /// O null passado indica falha na requisicao. Ja, se o map existir, ele
  /// pode ter um unico campo ('erro') caso o cep for invalido, ou estar todo
  /// preenchido se for valido.
  var url = Uri.parse('http://viacep.com.br/ws/${cep}/json/');
  var response = await http.get(url);

  if (response.statusCode == 200) return jsonDecode(response.body);

  return null;
}
