import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map?> validateCep({required String cep}) async {
  var url = Uri.parse('http://viacep.com.br/ws/${cep}/json/');
  var response = await http.get(url);

  if (response.statusCode == 200) return jsonDecode(response.body);

  return null;
}
