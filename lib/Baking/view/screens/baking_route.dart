
import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/view/screens/recipe_screens/add_recipe_screen.dart';
import 'package:baking_app/Baking/view/screens/recipe_screens/pastry_detail_screen.dart';
import 'package:baking_app/Baking/view/screens/user-screens/user_profile_screen.dart';
import 'package:baking_app/tabsNavigation.dart';
import 'package:flutter/material.dart';

class BakingAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => TabsNavigation());
    }

    if (settings.name == AddRecipeScreen.routeName) {
      return MaterialPageRoute(
          builder: (context) => AddRecipeScreen());
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
  // final bool edit;
  RecipeArgument({this.recipe});
}
