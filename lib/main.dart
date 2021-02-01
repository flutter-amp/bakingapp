import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Scaffold(
        appBar: AppBar(title: Text('Initial',style: TextStyle(color:Colors.black87),),backgroundColor: Color.fromRGBO(0, 0, 0, 0),elevation: 0,),
        body:Container(),
      )
    );
  }
}

