import 'package:flutter/material.dart';
import 'package:democlase3/services/ingresoService.dart';
import 'supermensajes.dart';


class ingreso extends StatefulWidget {
  @override
  _ingresoState createState() => _ingresoState();
}

class _ingresoState extends State<ingreso>{
  TextEditingController tituloController= TextEditingController();
  TextEditingController descripcionController=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Titulo'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:Column(
        children:[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Ingrese titulo aqui'),

          ),
        ],
        ),
      ),
    );
}


  Future<void> validarMensaje(String titulo, String descripcion) async{
    final response= await IngresoService().validar(titulo, descripcion);
    if(response.statusCode==201){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => supermensajes()));
    }
  }

}
