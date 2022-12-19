import 'package:democlase3/services/agregarnuevowakalaService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:democlase3/sideBar.dart';
import 'camara.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'listado.dart';
class nuevowakala extends StatefulWidget{

  const nuevowakala({super.key});
  @override
  _nuevowakalaState createState() => _nuevowakalaState();
}

class _nuevowakalaState extends State<nuevowakala>{
  TextEditingController sectorController=TextEditingController();
  TextEditingController descripcionController=TextEditingController();
  XFile? _foto1;
  XFile? _foto2;
  String _foto1b64="";
  String _foto2b64="";
  String xfileToBase64(XFile foto) {
    File file = File(foto.path);
    Uint8List imgbytes = file.readAsBytesSync();
    String bs4str = base64.encode(imgbytes);
    return bs4str;
  }
  Widget build(BuildContext context){
    const sizedBox = const SizedBox(height: 30);
    return Scaffold(
      drawer: const sideBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle:true,
        title: Text('Avisar por Nuevo Wakala',
            style: TextStyle(color:Colors.black,fontSize: 25)
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            /*TextField(
              minLines: 10,
              keyboardType: TextInputType.multiline,
              maxLines: 30,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Sector',
                  contentPadding: EdgeInsets.symmetric(vertical: 40),
              ),
              controller: descripcionController,
            ),
            //sizedBox,
            //sizedBox,*/
            SizedBox(
              width: 250,
              height: 80,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Sector',
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 25),
                maxLines: 20,
                minLines: 5,
                controller: sectorController,
              ),
            ),
            sizedBox,
            SizedBox(
              width: 350,
              height: 120,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 25),
                maxLines: 150,
                minLines: 15,
                controller: descripcionController,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    color: Colors.green,
                    child: const Text(
                        "Foto 1",
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.bold
                        )
                    ),
                    onPressed: () async {
                      final pict = await availableCameras().then((value) => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CameraPage(cameras: value,esFoto1: true))));
                      setState(() {
                        _foto1=pict;
                        _foto1b64=xfileToBase64(_foto1!);
                      });
                    },
                ),
                MaterialButton(
                    color: Colors.green,
                    child: const Text(
                        "Foto 2",
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.bold
                        )
                    ),
                  onPressed: () async {
                    final pict = await availableCameras().then((value) => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CameraPage(cameras: value,esFoto1: false))));
                    setState(() {
                      _foto2=pict;
                      _foto2b64=xfileToBase64(_foto2!);
                    });

                  },
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    if(_foto1?.path !=null) ...[
                      Image.file(File(_foto1!.path), fit: BoxFit.cover, width: 50),
                    ]
                    else...[
                      Icon(
                        Icons.add_a_photo_outlined,
                        size:70.0,
                      )
                    ]
                  ]),
                ),
                Center(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    if(_foto2?.path !=null) ...[
                      Image.file(File(_foto2!.path), fit: BoxFit.cover, width: 50),
                    ]
                    else...[
                      Icon(
                        Icons.add_a_photo_outlined,
                        size:70.0,
                      )
                    ]
                  ]),
                ),

              ],
            ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Colors.red,
                  child: const Text(
                      "Borrar",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: ()  {
                    setState(() {
                      _foto1=null;
                    });
                  },
                ),
                MaterialButton(
                  color: Colors.red,
                  child: const Text(
                      "Borrar",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: ()  {
                    setState(() {
                      _foto2=null;
                    });
                  },
                ),
              ]
          ),



            ElevatedButton(
              onPressed: ()async{
                if(sectorController.text.length == 0 || descripcionController.text.length==0 ){
                  Fluttertoast.showToast(
                      msg: "Por favor llena todos los campos",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                else if(descripcionController.text.length<15){
                  Fluttertoast.showToast(
                      msg: "Descripción debe tener minimo 15 caracteres",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                else if(_foto1 ==null){
                  Fluttertoast.showToast(
                      msg: "Debe enviar al menos la foto 1",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                else{
                  final  response= await NuevoWakalaService().validar(sectorController.text,descripcionController.text,_foto1b64,_foto2b64);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => listadowakalas()));
                }
              },
              child: Text('Denunciar Wakala'),
            ),
            sizedBox,
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context); //cierra la página y te devuelve a la página anterior
              },
              child: Text('Me arrepentí'),
            )
          ],
        ),
      ),
    );
  }
}