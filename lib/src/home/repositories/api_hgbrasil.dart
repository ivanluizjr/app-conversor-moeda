import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHgBrasil {
  final String urlApi =
      'https://api.hgbrasil.com/finance?format=json&key=44e7f7f3';

  Future<Map> getData() async {
    String request = urlApi;

    http.Response response = await http.get(Uri.parse(request));
    return json.decode(response.body);
  }
}
