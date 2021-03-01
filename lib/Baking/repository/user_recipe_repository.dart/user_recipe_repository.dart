// import 'dart:io';

// import 'package:baking_app/Baking/data_provider/recipe_data.dart';
// import 'package:baking_app/Baking/data_provider/user_recipe_data.dart';
// import 'package:baking_app/Baking/models/recipe.dart';
// import 'package:flutter/material.dart';

// class UserRecipeRepository{
//   final UserRecipeDataProvider dataProvider;
//   UserRecipeRepository({@required this.dataProvider})
//       : assert(dataProvider != null);



//       Future<List<Recipe>> getUserRecipes(int id)async{
   
//      return await dataProvider.getUserRecipes(id);
//   }
//   Future<void> deleteRecipe(int id) async {
//     await dataProvider.deleteRecipe(id);
//   }

// }