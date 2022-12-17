import 'dart:convert';
class postComentario {
  int id_wuakala;
  int id_autor;
  String descripcion;
  String fecha_comentario;

  postComentario({required this.id_wuakala,required this.descripcion,required this.id_autor,required this.fecha_comentario});

  factory postComentario.fromJson(Map json) {
    return postComentario(
      id_wuakala: json['id_wuakala'],
      descripcion: json['descripcion'],
      id_autor: json['id_autor'],
      fecha_comentario: json['fecha_comentario'],
    );
  }

  Map toMap() {
    var map = new Map();
    map['id_wuakala'] = id_wuakala;
    map['descripcion'] = descripcion;
    map['id_autor']=id_autor;
    map['fecha_comentario']=fecha_comentario;
    return map;
  }
}