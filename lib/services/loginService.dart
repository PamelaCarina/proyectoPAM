import 'dart:convert';
import 'package:democlase3/global.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<http.Response> validar(String email, String pass) async {
    return await http.get(Uri.parse( '${Global.url}/api/usuariosApi/GetUsuario?email=$email&password=$pass'));
  }
}
