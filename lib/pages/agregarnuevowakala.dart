
import 'package:democlase3/services/comentarioService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:democlase3/sideBar.dart';


class nuevowakala extends StatefulWidget{
  const nuevowakala({super.key});
  @override
  _nuevowakalaState createState() => _nuevowakalaState();
}

class _nuevowakalaState extends State<nuevowakala>{
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
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Sector',
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 25),
                maxLines: 3,
                minLines: 2,
                controller: descripcionController,
              ),
            ),
            sizedBox,
            SizedBox(
              width: 450,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 25),
                maxLines: 3,
                minLines: 2,
                controller: descripcionController,
              ),
            ),


            ElevatedButton(
              onPressed: ()async{
                if(descripcionController.text.length==0){
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