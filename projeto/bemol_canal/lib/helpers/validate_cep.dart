import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map?> cepIsValid({required String cep}) async {
  int cont = 0;
  var url = Uri.parse('http://viacep.com.br/ws/${cep}/json/');
  while (cont < 2) {
    var response = await http.get(url);

    if (response.statusCode == 200) return jsonDecode(response.body);
    cont += 1;
  }

  return null;
}