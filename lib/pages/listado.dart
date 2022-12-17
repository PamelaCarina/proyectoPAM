import 'package:democlase3/pages/detallewakala.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:democlase3/global.dart';
import 'package:democlase3/sideBar.dart';

class listadowakalas extends StatefulWidget {
  @override
  _listadowakalasState createState() => _listadowakalasState();
}

class _listadowakalasState extends State<listadowakalas>{
  List<ListadoWakalas> _listadowakalas=[];

  _getListadoWakalas() async {
    List<ListadoWakalas> message=[];
    var fechassinhora = [];
    final response = await http.get(Uri.parse('${Global.url}/api/wuakalasApi/Getwuakalas'));
    final jsonData= json.decode(response.body);
    for(var u in jsonData) {
      //aki quiero sacarle la hora a la fecha
      print(u['fecha']);
      //for(var u in u['fecha']){

      //}
      ListadoWakalas msg = ListadoWakalas(
          u['id'], u['sector'], u['autor'], u['fecha']);
      message.add(msg);
    }
    //print(message.length);
    setState((){
      _listadowakalas=message;
    });
  }
  @override
  void initState(){
    super.initState();
    _getListadoWakalas();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: const sideBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle:true,
        title: Text('Listado de Wakalas',
            style: TextStyle(color:Colors.black,fontSize: 25)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:20),
        child: ListView.builder(
          itemBuilder: (context,index) => Card(
            key: ValueKey(_listadowakalas[index].id),
            margin: const EdgeInsets.symmetric(vertical:5,horizontal:15),
            color: Colors.lightBlueAccent,
            elevation: 4,
            child: ListTile(
              title: Text(_listadowakalas[index].sector),
              trailing: const Icon(Icons.arrow_forward_ios ),
              onTap: (){
                Global.wakalaID=_listadowakalas[index].id;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => detallewakala(index : _listadowakalas[index].id)));
              },
              subtitle:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_listadowakalas[index].autor),
                  Text(_listadowakalas[index].fecha)
                ],
              ),
            ),
          ),
          itemCount:_listadowakalas.length,
        ),
      ),
    );
  }
}


class ListadoWakalas{
  int id;
  String sector, autor, fecha;
  ListadoWakalas(this.id,this.sector,this.autor,this.fecha);
}