// import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_event.dart';
// import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_state.dart';
// import 'package:baking_app/Baking/bloc/user_recipes/user_recipes_event.dart';
// import 'package:baking_app/Baking/bloc/user_recipes/user_recipes_state.dart';
// import 'package:baking_app/Baking/models/recipe.dart';
// import 'package:baking_app/Baking/repository/recipe/recipe_repository.dart';
// import 'package:baking_app/Baking/repository/user_recipe_repository.dart/user_recipe_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class UserRecipeBloc extends Bloc<UserRecipesEvent, UserRecipesState> {
//   final UserRecipeRepository userRecipeRepository;
//   final RecipeRepository recipeRepository;
  
//    UserRecipeBloc({@required this.userRecipeRepository,@required this.recipeRepository})
//       : assert(userRecipeRepository != null || recipeRepository!=null) ,
//         super(UserRecipeInProgress());

// List<Recipe> time = [];
//   @override
//   Stream<UserRecipesState> mapEventToState(UserRecipesEvent event) async* {


//     //   if( event is UserRecipeRetrieve){

//     //   yield UserRecipeInProgress();
//     //    try {
//     //    final recipes = await userRecipeRepository.getUserRecipes(event.id);

//     //     yield UserRecipeSuccessfull(recipes);

//     //   } catch ( error) {
        
//     //     print("my errorrrrrrrrrrrrrrrrrrrrrrrrrrr" );
//     //     yield UserRecipeFailure();
//     //   }
//     // }
//     // if( event is UserRecipeDelete){
//     //   yield UserRecipeInProgress();
//     //    try {
//     //      await userRecipeRepository.deleteRecipe(event.id);
//     //    final recipes = await userRecipeRepository.getUserRecipes(event.userID);
//     //    //final allRecipes=await recipeRepository.dataProvider.getRecipes();
       
//     //     yield UserRecipeSuccessfull(recipes);
//     //   } catch ( error) {
        
//     //     print(error);
//     //     yield UserRecipeFailure();
//     //   }
//     // }

  
//   }
// }
