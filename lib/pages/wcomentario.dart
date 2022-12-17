
import 'package:democlase3/services/comentarioService.dart';
import 'package:democlase3/postComentario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class wcomentario extends StatefulWidget{
  const wcomentario({super.key});
  @override
  _wcomentarioState createState() => _wcomentarioState();
}

class _wcomentarioState extends State<wcomentario>{
  TextEditingController descripcionController=TextEditingController();
  Widget build(BuildContext context){
    const sizedBox = const SizedBox(height: 30);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              minLines: 10,
              keyboardType: TextInputType.multiline,
              maxLines: 30,
              decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Ingrese comentario aqui'
                ),
                controller: descripcionController,
              ),
            sizedBox,
            sizedBox,
            ElevatedButton(
              onPressed: ()async{
                if(descripcionController.text.length==0){
                  Fluttertoast.showToast(
                      msg: "Comentario no puede estar vacio",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                else{
                  final  comentario= await ComentarioService().validar(descripcionController.text);
                  Navigator.pop(context,comentario);
                }
              },
              child: Text('Comentar Wakala'),
            ),
            sizedBox,
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context,null);
                },
                child: Text('Me arrepenti'),
            )
          ],
        ),
      ),
    );
  }
}