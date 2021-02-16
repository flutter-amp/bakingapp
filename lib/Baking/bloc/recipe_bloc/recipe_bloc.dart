import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_state.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInProgress());
List<Recipe> time = [Recipe("1","f",3,"G","f",[],[])];
    
  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {

    if (event is RecipeCreate) {
      
      try {
        await Future.delayed(Duration(seconds: 3));
        time.add(event.recipe);
           print("length ${time.length}");
       
        yield RecipeSuccessfull(time);
      } catch (_) {
        yield RecipeFailure();
      }
    }
    if( event is RecipeRetrieve){
      yield RecipeInProgress();
      await Future.delayed(Duration(seconds: 3));
       try {
        print("length ${time.length}");
       
        yield RecipeSuccessfull(time);
      } catch (_) {
        yield RecipeFailure();
      }
    }
    if (event is RecipeDelete) {
      try {
           print("length ${time.length}");
       await Future.delayed(Duration(seconds: 3));
        time.removeWhere((element) => element.id==event.recipe.id);
         print("length ${time.length}");
        yield RecipeSuccessfull(time);
      } catch (_) {
        yield RecipeFailure();
      }
    }
  }
}
