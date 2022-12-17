
import 'package:flutter/material.dart';
import 'package:democlase3/services/detallewakalaService.dart';
import 'package:democlase3/global.dart';
import 'package:democlase3/postComentario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detallefoto.dart';
import'wcomentario.dart';

class detallewakala extends StatefulWidget {
  final int index;
  const detallewakala({super.key, required this.index});
  @override
  _detallewakalaState createState() => _detallewakalaState();
}

class _detallewakalaState extends State<detallewakala> {
  late Wakala _detallewakala;
  List<Comentario> _comentarios=[];
  int _yanoesta=0;
  int _sigueahi=0;

  Future<void> _navegaryseleccionarComentario(BuildContext context) async {
    final comentario = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const wcomentario()),
    );
    setState((){
      if(comentario!=null){
        _comentarios.add(Comentario(_comentarios.length+1,comentario.descripcion,Global.nombre,comentario.fecha_comentario));
      }
    });
    if (!mounted) return;
  }
  _getDetalleWakala() async{
    List<Comentario> comm=[];
    final response= await DetalleWakalaService().validar(widget.index);
    if(response.statusCode!=200){
      print('error');
    }
    final jsonData= json.decode(response.body);
    for(var i in jsonData['comentarios']){
      comm.add(Comentario(i['id'], i['descripcion'],i['autor'],i['fecha_comentario']));
    }
    setState((){
      _detallewakala=Wakala(jsonData['id'],jsonData['sector'],jsonData['descripcion'],jsonData['fecha_publicacion'],jsonData['autor'],jsonData['url_foto1'],jsonData['url_foto2'],jsonData['sigue_ahi'],jsonData['ya_no_esta']);
      _comentarios=comm;
    });
  }
  yanoesta(){
    setState(() {
      ++_yanoesta;
    });
  }
  sigueahi(){
    setState(() {
      ++_sigueahi;
    });
  }
  @override
  void initState() {
    super.initState();
    _getDetalleWakala();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle:true,
        title: Text(_detallewakala.sector,
            style: TextStyle(color:Colors.black,fontSize: 25)
        ),
      ),
      body:Padding ( padding: const  EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 30),
             Text(_detallewakala.descripcion,
            textAlign: TextAlign.center,
             ),
            SizedBox(height:50),
            Row(
              children: [
                GestureDetector(
                  child:Image.network('${Global.url}/images/' +_detallewakala.url_foto1,height: 150.0,width: 150.0),
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => detallefoto(url_foto : _detallewakala.url_foto1)));
                  }
                ),
                GestureDetector(
                  child:Image.network('${Global.url}/images/' +_detallewakala.url_foto2,height: 150.0,width: 150.0),
                  onTap:(){
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context)=> detallefoto(url_foto : _detallewakala.url_foto2)));
                  }
                )
              ],
            ),
            ElevatedButton(
                onPressed: (){
                  _navegaryseleccionarComentario(context);
                },
                child: const Text('Comentar')
            )
          ],
        )
      ),



  );}
}


class Wakala{
  final String sector, descripcion, fecha_publicacion, autor, url_foto1, url_foto2;
  final int id, sigue_ahi, ya_no_esta;

  Wakala(this.id,this.sector,this.descripcion, this.fecha_publicacion,this.autor,this.url_foto1,this.url_foto2,this.sigue_ahi,this.ya_no_esta);
}

class Comentario{
  final String descripcion, fecha_comentario, autor;
  final int id;
  Comentario(this.id,this.descripcion,this.autor,this.fecha_comentario);
}