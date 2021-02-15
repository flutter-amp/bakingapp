import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/data_provider/recipe_data.dart';
import 'package:baking_app/Baking/repository/recipe/recipe_repository.dart';
import 'package:baking_app/Baking/view/screens/baking_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:http/http.dart' as http;

void main() {
  final RecipeRepository recipeRepository = RecipeRepository(
    dataProvider: RecipeDataProvider(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MyApp(recipeRepository: recipeRepository),
    // BlocProvider(

    //   create: (context)=>RecipeBloc()..add(RecipeRetrieve()),
    //   child: MyApp(),

    // ),
  );
}

class MyApp extends StatelessWidget {
  final RecipeRepository recipeRepository;

  MyApp({@required this.recipeRepository}) : assert(recipeRepository != null);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return RepositoryProvider.value(
      value: this.recipeRepository,
      child: BlocProvider(
        create: (context) => RecipeBloc(recipeRepository: this.recipeRepository)..add(RecipeRetrieve()),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  bodyText2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  headline5: TextStyle(
                    color: Color.fromRGBO(10, 56, 92, 1),
                    // fontSize: 20,
                    // fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                  headline4: TextStyle(
                    color: Color.fromRGBO(10, 56, 92, 1),
                    // fontSize: 20,
                    // fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                ),

            //backgroundColor:Color.fromRGBO(125,125 ,125 , 0.1),
            accentColor: Colors.red[300],
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // home:TabsNavigation(),
          onGenerateRoute: BakingAppRoute.generateRoute,
        ),
      ),
    );
  }
}
