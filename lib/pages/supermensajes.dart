import 'package:flutter/material.dart';
import 'package:democlase3/services/getMessage.dart';

class supermensajes extends StatefulWidget {
  @override
  _supermensajesState createState() => _supermensajesState();
}

class _supermensajesState extends State<supermensajes>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Supermensajes'),
      ),
    );
  }

}