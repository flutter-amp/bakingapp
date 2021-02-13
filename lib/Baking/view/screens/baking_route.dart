
import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:baking_app/Baking/view/screens/recipe_screens/add_recipe_page_screen.dart';
import 'package:baking_app/Baking/view/screens/recipe_screens/pastry_detail_screen.dart';
import 'package:baking_app/Baking/view/screens/user-screens/user_profile_screen.dart';
import 'package:baking_app/tabsNavigation.dart';
import 'package:flutter/material.dart';

class BakingAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => TabsNavigation());
    }

    if (settings.name == AddRecipePageScreen.routeName) {
      return MaterialPageRoute(
          builder: (context) => AddRecipePageScreen());
    }

    if (settings.name == UserProfileScreen.routeName) {
     // Course course = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => UserProfileScreen(
       //         course: course,
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
