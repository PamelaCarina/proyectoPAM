import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:democlase3/global.dart';
import 'package:http/http.dart' as http;

class supermensajes extends StatefulWidget {
  @override
  _supermensajesState createState() => _supermensajesState();
}

class _supermensajesState extends State<supermensajes>{
  List<Mensaje> _listamensaje=[];
  _getMensaje() async {
    var response= await http.get(Uri.https('https://40fd422c6d4d.sa.ngrok.io','api/mensajes'));
    final document=  xml.XmlDocument.parse(response.body);
    final mensajesNode = document.findElements('ArrayOfMensajes').first;
    final mensajes= mensajesNode.findElements('Mensajes');
    List<Mensaje> message=[];
    print(Global.login);
    for(final mensaje in mensajes){
      if(mensaje.findElements('login').first.text==Global.login){ //si es el mensaje del usuario
        final fecha= mensaje.findElements('fecha').first.text;
        final login= mensaje.findElements('login').first.text;
        final titulo= mensaje.findElements('titulo').first.text;
        final descripcion= mensaje.findElements('descripcion').first.text;
        Mensaje msg= Mensaje(fecha,login,titulo,descripcion);
        message.add(msg);
      }
    }
    print(message.length);
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Supermensajes'),
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
        ),
      ),
    );
  }
}


class Mensaje{
  final String fecha, login, titulo, descripcion;
  Mensaje(this.fecha,this.login,this.titulo,this.descripcion);
}