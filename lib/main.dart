import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/view/screens/baking_route.dart';
import 'package:baking_app/tabsNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './Baking//bloc/recipe_bloc/recipe_event.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  runApp(
    BlocProvider(

      create: (context)=>RecipeBloc(),
      child: MyApp(),

    ),
  );
}

class RecipeRetreive {
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
      // home:TabsNavigation(),
      onGenerateRoute: BakingAppRoute.generateRoute,
    );
  }
}
