import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:democlase3/global.dart';
import 'package:http/http.dart' as http;

class supermensajes extends StatefulWidget {
  @override
  _supermensajesState createState() => _supermensajesState();
}

class _supermensajesState extends State<supermensajes>{
  Future getMensaje() async {
    var response= await http.get(Uri.https('https://40fd422c6d4d.sa.ngrok.io','/api/mensajes'));
    final document=  xml.XmlDocument.parse(response.body);
    final mensajesNode = document.findElements('ArrayOfMensajes').first;
    final mensajes= mensajesNode.findElements('Mensajes');
    List<Mensaje> message=[];
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
    return message;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Supermensajes'),
      ),
      body: Container(
        child: Card(child: FutureBuilder(
          future: getMensaje(),
          builder: (context, AsyncSnapshot snapshot){
            if (snapshot.data==null){
              return Container(
                child: const Center(child:Text('Cargando...'),
                ),
              );
              } else
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,i){
                      return ListTile(
                      title: Text(snapshot.data[i].titulo),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data[i].descripcion),
                          Text(snapshot.data[i].fecha),
                          Text(snapshot.data[i].login),
                    ],
                  ),
                );
              });
          },
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