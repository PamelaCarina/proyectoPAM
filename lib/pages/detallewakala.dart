import 'principal.dart';
import 'package:flutter/material.dart';
import 'package:democlase3/services/detallewakalaService.dart';
import 'package:democlase3/global.dart';

class detallewakala extends StatefulWidget {
  const detallewakala({super.key});
  @override
  _detallewakalaState createState() => _detallewakalaState();
}

class _detallewakalaState extends State<detallewakala> {
  List<Wakala> _listaWakala=[];
  // TODO : logica de fetch desde detalleservicio en API
  _getDetalleWakala() async{
    List<Wakala> infoWakala=[];
    final response= await DetalleWakalaService().validar(Global.wakalaID);

    setState((){
      _listaWakala=infoWakala;
    });

  }

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context){return Scaffold();}
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
