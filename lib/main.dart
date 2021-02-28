import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/bloc/ingredient_bloc/ingredient_event.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/data_provider/comment_data.dart';
import 'package:baking_app/Baking/data_provider/recipe_data.dart';
import 'package:baking_app/Baking/repository/comment/comment_repository.dart';
import 'package:baking_app/Baking/repository/recipe/recipe_repository.dart';
import 'package:baking_app/Baking/view/screens/baking_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Baking/bloc/ingredient_bloc/ingredient_bloc.dart';
import 'Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:http/http.dart' as http;

import 'Baking/bloc/recipe_state/step_bloc.dart';
import 'Baking/data_provider/ingredient.data_provider.dart';
import 'Baking/data_provider/step_date_provider.dart';
import 'Baking/repository/ingredient/ingredient_repository.dart';
import 'Baking/repository/recipe_state/step_repository.dart';

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
  final IngredientRepository ingredientRepository = IngredientRepository(
    dataProvider: IngredientDataProvider(
      httpClient: http.Client(),
    ),
  );
    final StepRepository stepRepository = StepRepository(
    dataProvider: StepDataProvider(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MyApp(
      recipeRepository: recipeRepository,
      commentRepository: commentRepository,
      ingredientRepository: ingredientRepository,
      stepRepository: stepRepository,
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
  final IngredientRepository ingredientRepository;
final StepRepository stepRepository;
  MyApp(
      {@required this.recipeRepository,
      @required this.commentRepository,
      @required this.ingredientRepository,
      @required this.stepRepository,})
      : assert(recipeRepository != null ||
            commentRepository != null ||
            ingredientRepository != null ||stepRepository!=null );
  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => this.recipeRepository),
        RepositoryProvider(create: (context) => this.commentRepository),
        RepositoryProvider(create: (context) => this.ingredientRepository),
        RepositoryProvider(create: (context) => this.stepRepository),
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
                  CommentBloc(commentRepository: this.commentRepository)),
                   BlocProvider(
              create: (context) =>
                  IngredientBloc(ingredientRepository: this.ingredientRepository)),
                     BlocProvider(
              create: (context) =>
                  StepBloc(stepRepository: this.stepRepository))
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
