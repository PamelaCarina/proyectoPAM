import 'dart:convert';
class postComentario {
  int id_wuakala;
  int id_autor;
  String descripcion;
  String fecha_comentario;
  postComentario({required this.id_wuakala,required this.descripcion,required this.id_autor,required this.fecha_comentario});

  factory postComentario.fromJson(Map json) {
    List comentarios= json['comentarios'];

    return postComentario(
      id_wuakala: comentarios.last['id_wuakala'],
      descripcion: comentarios.last['descripcion'],
      id_autor: comentarios.last['id_autor'],
      fecha_comentario:  comentarios.last['fecha_comentario'],
    );
  }

  Map toMap() {
    var map = new Map();
    map['id_wuakala'] = id_wuakala;
    map['descripcion'] = descripcion;
    map['id_autor']=id_autor;
    return map;
  }
}