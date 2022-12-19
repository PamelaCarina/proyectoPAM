import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:democlase3/global.dart';
import 'package:http/http.dart' as http;

class DetalleWakalaService {
  Future<http.Response> validar(int id) async {
    return await http.get(Uri.parse( '${Global.url}/api/wuakalasApi/Getwuakala/$id'));
  }
  Future<http.Response> putSigueAhi(int index) async {
    return await http.put(
        Uri.parse('${Global.url}/api/wuakalasApi/PutSigueAhi/$index'));
  }
  Future<http.Response> putYaNoEsta(int index) async {
    return await http.put(
        Uri.parse('${Global.url}/api/wuakalasApi/PutYanoEsta/$index'));
  }

}