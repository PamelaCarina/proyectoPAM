
import 'package:democlase3/services/comentarioService.dart';
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
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('El comentario no puede estar vacio')));
                }
                else{
                  final  comentario= await ComentarioService().validar(descripcionController.text);
                  ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Comentario escrito')));
                  Navigator.pop(context);
                }
              },
              child: Text('Comentar Wakala'),
            ),
            sizedBox,
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Me arrepenti'),
            )
          ],
        ),
      ),
    );
  }
}