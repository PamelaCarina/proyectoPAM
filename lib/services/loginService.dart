import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  Future<http.Response> validar(String email, String pass) async {
    return await http.get(Uri.parse('https://03a8a3d1b59a.sa.ngrok.io/api/usuariosApi/GetUsuario?email=$email&password=$pass'));
  }
}
