import 'dart:convert';
import 'package:democlase3/global.dart';
import 'package:http/http.dart' as http;


class NuevoWakalaService{
  Future<http.Response> validar(String sector, String descripcion, String base64Foto1, String base64Foto2) async {
    return await http.post(
      Uri.parse('${Global.url}/api/wuakalasApi/Postwuakalas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'sector': sector,
        'descripcion' : descripcion,
        'id_autor' : Global.id_usuario.toString(),
        'base64Foto1' : base64Foto1,
        'base64Foto2' : base64Foto2
      }),
    );

  }
}