
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_bloc.dart';
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_state.dart';
import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/view/screens/recipe_screens/add_recipe_screen.dart';
import 'package:baking_app/Baking/view/screens/recipe_screens/pastry_detail_screen.dart';
import 'package:baking_app/Baking/view/screens/user-screens/sign_in_screen.dart';
import 'package:baking_app/Baking/view/screens/user-screens/sign_up_screen.dart';
import 'package:baking_app/Baking/view/screens/user-screens/user_profile_screen.dart';
import 'package:baking_app/tabsNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BakingAppRoute {

  static Route generateRoute(RouteSettings settings) {

    if (settings.name == '/signup') {
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    }
    if(settings.name == SignInScreen.routeName){
      return MaterialPageRoute(builder: (context) {
          return AuthForm();
      });
    }

    if (settings.name == AddRecipeScreen.routeName) {
      return MaterialPageRoute(
          builder: (context) => AddRecipeScreen(settings.arguments));
    }

    if (settings.name == UserProfileScreen.routeName) {
     // Course course = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => UserProfileScreen(
       //         course: course,
              ));
    }
        if (settings.name == PastryDetailScreen.routeName) {
      Recipe recipe = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => PastryDetailScreen(
                recipe: recipe,
              ));
    }


    return MaterialPageRoute(builder: (context) => PastryDetailScreen());
  }
}

class RecipeArgument {
  final Recipe recipe;
   final bool add;
  RecipeArgument({this.recipe,this.add});
}
