
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'package:democlase3/global.dart';

class mensajeService{
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
}

class Mensaje{
  final String fecha, login, titulo, descripcion;
  Mensaje(this.fecha,this.login,this.titulo,this.descripcion);
}