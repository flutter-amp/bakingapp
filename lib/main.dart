import 'package:baking_app/tabsNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red[300],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:TabsNavigation(),
   //   onGenerateRoute: ,
    );
  }
}

