import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_state.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial());
List<Recipe> time = [];
  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    // TODO: implement mapEventToState
    if (event is RecipeCreate) {
      try {
        
        time.add(event.recipe);
        yield RecipeSuccessfull(time);
      } catch (_) {
        yield RecipeFailure();
      }
    }
    if( event is RecipeRetrieve){
       try {
        List<Recipe> time = [];
        yield RecipeSuccessfull(time);
      } catch (_) {
        yield RecipeFailure();
      }
    }
  }
}
