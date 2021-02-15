import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_state.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/repository/recipe/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository recipeRepository;
  
   RecipeBloc({@required this.recipeRepository})
      : assert(recipeRepository != null),
        super(RecipeInProgress());

List<Recipe> time = [];
  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    // TODO: implement mapEventToState
    if (event is RecipeCreate) {
      try {
        await recipeRepository.createRecipe(event.recipe);
       final recipe = await recipeRepository.getRecipes();
        yield RecipeSuccessfull(recipe);
      } catch (e) {
            
             print(e);
        yield RecipeFailure();
      }
    }
    if( event is RecipeRetrieve){
      yield RecipeInProgress();
       try {
       final recipes = await recipeRepository.getRecipes();
        yield RecipeSuccessfull(recipes);
      } catch ( error) {
        
        print(error);
        yield RecipeFailure();
      }
    }
  }
}
