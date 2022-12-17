
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:democlase3/global.dart';
import 'package:http/http.dart' as http;
import 'package:democlase3/postComentario.dart';

class ComentarioService{
  Future<postComentario> validar(String descripcion) async {
    final response = await http.post(
      Uri.parse('${Global.url}/api/comentariosApi/Postcomentario'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id_wuakala': Global.wakalaID.toString(),
        'descripcion' : descripcion,
        'id_autor' : Global.id_usuario.toString(),
      }),
    );
    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return postComentario.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Fallo al enviar comentario.');
    }
  }
}