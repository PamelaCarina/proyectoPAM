
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:democlase3/global.dart';

class detallefoto extends StatelessWidget{
  final String url_foto;
  const detallefoto({super.key, required this.url_foto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network('${Global.url}/images/' +url_foto,height:600,width:250),
            ElevatedButton(
                onPressed: (){
                    Navigator.pop(context);
                  },
                child: Text('Volver')
            ),

          ]
        ),
      )

    );

  }

}