
import 'package:flutter/material.dart';
import 'package:democlase3/services/detallewakalaService.dart';
import 'package:democlase3/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class detallewakala extends StatefulWidget {
  final int index;
  const detallewakala({super.key, required this.index});
  @override
  _detallewakalaState createState() => _detallewakalaState();
}

class _detallewakalaState extends State<detallewakala> {
  late Wakala _detallewakala;
  _getDetalleWakala() async{
    late Wakala wakala;
    List<Comentario> comm=[];
    final response= await DetalleWakalaService().validar(widget.index);
    if(response.statusCode!=200){
      print('error');
    }
    final jsonData= json.decode(response.body);
    for(var i in jsonData['comentarios']){
      comm.add(Comentario(i['id'],i['descripcion'],i['fecha_comentario'],i['autor']));
    }
    wakala= Wakala(jsonData['id'],jsonData['sector'],jsonData['descripcion'],jsonData['fecha_publicacion'],jsonData['autor'],jsonData['url_foto1'],jsonData['url_foto2'],jsonData['sigue_ahi'],jsonData['ya_no_esta'], comm);

    setState((){
      _detallewakala=wakala;
    });
    print(_detallewakala.id);
  }

  @override
  void initState() {
    super.initState();
    _getDetalleWakala();
  }
  Widget build(BuildContext context){return Scaffold(


  );}
}


class Wakala{
  final String sector, descripcion, fecha_publicacion, autor, url_foto1, url_foto2;
  final int id, sigue_ahi, ya_no_esta;
  final List<Comentario> comentarios;
  Wakala(this.id,this.sector,this.descripcion, this.fecha_publicacion,this.autor,this.url_foto1,this.url_foto2,this.sigue_ahi,this.ya_no_esta,this.comentarios);
}
class Comentario{
  final int id;
  final String descripcion, fecha_comentario, autor;
  Comentario(this.id,this.descripcion,this.fecha_comentario,this.autor);
}
