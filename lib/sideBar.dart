
import 'package:flutter/material.dart';
import 'package:democlase3/sideBar_item.dart';
import 'package:democlase3/pages/login.dart';

class sideBar extends StatelessWidget{
  const sideBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Material(
        color: Colors.blueAccent,
          child: Column(
            children:[
              sideBarItem(
                  name: 'Salir',
                  onPressed: ()=> onItemPressed(context,index:2)
              ),
            ],
          ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);
    switch(index){
      case 0:
        Navigator.push(context,MaterialPageRoute(builder: (context)=> const login()));
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }

}