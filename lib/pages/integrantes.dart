import 'package:flutter/material.dart';

class integrantes extends StatelessWidget{
  const integrantes({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Integrantes',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Integrantes'),
        ),
        body: Center(
          child: Column(
            children:[
              const Text('Pamela Pinilla'),
              const Text('Carlos Venegas'),
            ],
          ),
        ),
      ),
    );
  }
}