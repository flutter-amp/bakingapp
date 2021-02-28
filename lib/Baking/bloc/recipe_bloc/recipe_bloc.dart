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
      print('heeeeeeeeeeeeeeeeeeeeeeeeeee');
      yield RecipeInProgress();
       try {
       final recipes = await recipeRepository.getRecipes();
        yield RecipeSuccessfull(recipes);
      } catch ( error) {
        
        print(error);
        yield RecipeFailure();
      }
    }
    if( event is RecipeDelete){
      yield RecipeInProgress();
       try {
         await recipeRepository.deleteRecipe(event.recipe.id);
       final recipes = await recipeRepository.getRecipes();
        yield RecipeSuccessfull(recipes);
      } catch ( error) {
        
        print(error);
        yield RecipeFailure();
      }
    }
  }
}
