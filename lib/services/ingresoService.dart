import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:democlase3/global.dart';
import 'package:http/http.dart' as http;
import 'package:democlase3/postMensaje.dart';
class IngresoService {
  Future<postMensaje> validar(String titulo, String descripcion) async {
    final response = await http.post(
      Uri.parse('${Global.url}/api/mensajes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'login': Global.login,
        'fecha': DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
        'titulo': titulo,
        'texto' : descripcion
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return postMensaje.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}