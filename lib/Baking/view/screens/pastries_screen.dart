
import 'package:baking_app/Baking/view/widgets/pastery_item.dart';
import 'package:flutter/material.dart';

class PastriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pastries',style: TextStyle(color:Colors.black87),),backgroundColor: Color.fromRGBO(0, 0, 0, 0),elevation: 0,),
        body:Container(
          color:Color.fromRGBO(125,125 ,125 , 0.1),
          child:Column(
            children:[
              PasteryItem(),
              PasteryItem()
            ]
          )
        ),
        floatingActionButton: FloatingActionButton(child:Icon(Icons.add),onPressed: (){},),
      );
  }
}