
import 'dart:convert';
import 'package:democlase3/global.dart';
import 'package:http/http.dart' as http;


class ComentarioService{
  Future<http.Response> validar(String descripcion) async {
    return await http.post(
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

  }
}