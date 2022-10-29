import 'package:flutter/material.dart';
import 'package:democlase3/services/ingresoService.dart';
import 'supermensajes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ingreso extends StatefulWidget {
  @override
  _ingresoState createState() => _ingresoState();
}

class _ingresoState extends State<ingreso>{

  TextEditingController tituloController= TextEditingController();
  TextEditingController descripcionController=TextEditingController();
  @override
  Widget build(BuildContext context){
    const sizedBox = const SizedBox(height: 30);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Titulo',style:TextStyle(color:Colors.black)),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:Column(
        children:[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Ingrese titulo aqui'),
            controller: tituloController,
          ),
          TextField(
            minLines: 15,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Ingrese texto aqui'),
            controller: descripcionController,
          ),
          sizedBox,
          sizedBox,
          SizedBox(
              width: double.infinity,
              height: 30,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.indigo, shape: StadiumBorder()),
                  onPressed: () {
                    if (tituloController.text.length == 0) {
                      Fluttertoast.showToast(
                          msg: "Ingrese un titulo valido",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      IngresoService().validar(
                          tituloController.text, descripcionController.text);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => supermensajes()));
                    }
                  },
                  child: Text("Enviar"))),
        ],
        ),
      ),
    );
}




}
