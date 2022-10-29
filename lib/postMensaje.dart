import 'dart:convert';
class postMensaje {
  String login;
  int id;
  String titulo;
  String texto;
  String fecha;
  postMensaje({required this.login,required this.id,required this.titulo,required this.texto,required this.fecha});

  factory postMensaje.fromJson(Map json) {
    return postMensaje(
      login: json['login'],
      id: json['id'],
      titulo: json['titulo'],
      texto: json['texto'],
      fecha: json['fecha'],
    );
  }

  Map toMap() {
    var map = new Map();
    map['titulo'] = titulo;
    map['texto'] = texto;
    map['id']=id;
    map['fecha']=fecha;

    return map;
  }
}