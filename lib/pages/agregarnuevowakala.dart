import 'package:democlase3/services/comentarioService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:democlase3/sideBar.dart';
import 'camara.dart';
import 'package:camera/camera.dart';


class nuevowakala extends StatefulWidget{
  const nuevowakala({super.key});
  @override
  _nuevowakalaState createState() => _nuevowakalaState();
}

class _nuevowakalaState extends State<nuevowakala>{
  TextEditingController sectorController=TextEditingController();
  TextEditingController descripcionController=TextEditingController();


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
                      await availableCameras().then((value) => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
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
                    onPressed: () {
                    }
                ),
              ]
            ),



            ElevatedButton(
              onPressed: ()async{
                if(sectorController.text.length == 0 || descripcionController.text.length==0){
                  Fluttertoast.showToast(
                      msg: "Por favor llena todos los campos",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                else{
                  final  comentario= await ComentarioService().validar(descripcionController.text);
                  print(comentario.statusCode);
                  Navigator.pop(context);
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