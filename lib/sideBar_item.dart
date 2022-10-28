import 'package:flutter/material.dart';

class sideBarItem extends StatelessWidget{
  const sideBarItem({Key? key, required this.name, required this.onPressed}) : super(key:key);
  final String name;
  final Function() onPressed;

  @override
  Widget build(BuildContext context){
    return InkWell(
        onTap: onPressed,
        child:SizedBox(
          height:40,
          child: Row(
            children: [
              Text(name, style:  TextStyle(fontSize:20,color:Colors.black87))
            ],
        ),
      ),
    );
  }
}