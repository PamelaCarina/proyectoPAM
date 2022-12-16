import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:democlase3/global.dart';
import 'package:democlase3/sideBar.dart';
class supermensajes extends StatefulWidget {
  @override
  _supermensajesState createState() => _supermensajesState();
}

class _supermensajesState extends State<supermensajes>{
  List<Mensaje> _listamensaje=[];

  _getMensaje() async {
      List<Mensaje> message=[];
      final response = await http.get(Uri.parse('https://40fd422c6d4d.sa.ngrok.io/api/mensajes'));
      final jsonData= json.decode(response.body);
      for(var u in jsonData) {
        if(u['login']==Global.login) {
          Mensaje msg = Mensaje(
              u['fecha'], u['login'], u['titulo'], u['texto']);
          message.add(msg);
        }
      }
    //print(message.length);
    setState((){
      _listamensaje=message;
    });
  }

  @override
  void initState(){
    super.initState();
    _getMensaje();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: const sideBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle:true,
        title: Text('Supermensajes',
            style: TextStyle(color:Colors.black,fontSize: 25)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:20),
        child: ListView.builder(
          itemBuilder: (context,index) => Card(
            key: ValueKey(_listamensaje[index].login),
            margin: const EdgeInsets.symmetric(vertical:5,horizontal:15),
            color: Colors.lightBlueAccent,
            elevation: 4,
            child: ListTile(
              title: Text(_listamensaje[index].titulo),
              subtitle:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_listamensaje[index].descripcion),
                  Text(_listamensaje[index].login),
                  Text(_listamensaje[index].fecha)
                ],
              ),
            ),
          ),
          itemCount:_listamensaje.length,
        ),
      ),
    );
  }
}


class Mensaje{
  final String fecha, login, titulo, descripcion;
  Mensaje(this.fecha,this.login,this.titulo,this.descripcion);
}