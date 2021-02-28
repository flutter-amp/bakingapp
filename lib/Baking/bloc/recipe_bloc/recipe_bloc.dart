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
      yield RecipeInProgress();
      try {
        await recipeRepository.createRecipe(event.recipe);
       
       final recipe = await recipeRepository.getRecipes();
       print("checkkkkkkkkkkkkkkkkkkkkkkk");
        yield RecipeSuccessfull(recipe);
           print("kjjjjjjjjjjjjjjjjjjjj");
      } catch (e) {
        print("hhhhhhhhhhhhhhhhhhh");
            
        yield RecipeFailure();
      }
    }
    if( event is RecipeRetrieve){
      print('heeeeeeeeeeeeeeeeeeeeeeeeeee');
      yield RecipeInProgress();
       try {
       final recipes = await recipeRepository.getRecipes();
        print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
        yield RecipeSuccessfull(recipes);
         print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
      } catch ( error) {
        
        print("my errorrrrrrrrrrrrrrrrrrrrrrrrrrr" );
        yield RecipeFailure();
      }
    }
    if(event is RecipeImageRetrieve){
            yield RecipeInProgress();
       try {
      // final image = await recipeRepository.getRecipe();
        print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
        final recipes = await recipeRepository.getRecipes();
        print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
        yield RecipeSuccessfull(recipes);
    
         print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
      } catch ( error) {
        
        print("my errorrrrrrrrrrrrrrrrrrrrrrrrrrr" );
        yield RecipeFailure();
      }
    }
       if( event is RecipeUpdate){
      print('heeeeeeeeeeeeeeeeeeeeeeeeeee');
      yield RecipeInProgress();
       try {
       await recipeRepository..updateRecipe(event.recipe);
        final recipes = await recipeRepository.getRecipes();
        print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
        yield RecipeSuccessfull(recipes);
         print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
      } catch ( error) {
        
        print("my errorrrrrrrrrrrrrrrrrrrrrrrrrrr" );
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
