import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:democlase3/global.dart';
import 'package:http/http.dart' as http;

class IngresoService {
  Future<http.Response> validar(String titulo, String descripcion) async {
    return await http.post(
      Uri.parse('https://40fd422c6d4d.sa.ngrok.io/api/Usuarios'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'login': Global.login,
        'fecha': DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
        'titulo': titulo,
        'texto' : descripcion
      }),
    );
  }
}