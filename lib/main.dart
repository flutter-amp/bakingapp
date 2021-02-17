import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/data_provider/comment_data.dart';
import 'package:baking_app/Baking/data_provider/recipe_data.dart';
import 'package:baking_app/Baking/repository/comment/comment_repository.dart';
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

  final CommentRepository commentRepository = CommentRepository(
    dataProvider: CommentDataProvider(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MyApp(
      recipeRepository: recipeRepository,
      commentRepository: commentRepository,
    ),
    // BlocProvider(

    //   create: (context)=>RecipeBloc()..add(RecipeRetrieve()),
    //   child: MyApp(),

    // ),
  );
}

class MyApp extends StatelessWidget {
  final RecipeRepository recipeRepository;
  final CommentRepository commentRepository;

  MyApp({@required this.recipeRepository, @required this.commentRepository})
      : assert(recipeRepository != null || commentRepository != null);
  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => this.recipeRepository),
        RepositoryProvider(create: (context) => this.commentRepository)
      ],
      //value: this.recipeRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  RecipeBloc(recipeRepository: this.recipeRepository)
                    ..add(RecipeRetrieve())),
                      BlocProvider(
              create: (context) =>
                  CommentBloc(commentRepository: this.commentRepository))
        ],
        // create: (context) => RecipeBloc(recipeRepository: this.recipeRepository)..add(RecipeRetrieve()),
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
