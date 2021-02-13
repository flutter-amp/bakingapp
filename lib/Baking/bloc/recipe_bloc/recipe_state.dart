import 'package:baking_app/Baking/models/recipe.dart';
import 'package:equatable/equatable.dart';

class  RecipeState extends Equatable{
   
RecipeState();
 @override
  List<Object> get props => [];
} 
class RecipeInitial extends RecipeState{
 
}
class RecipeSuccessfull extends RecipeState{
  final List<Recipe> recipes;
  RecipeSuccessfull([this.recipes=const []]);
    @override
  List<Object> get props => [recipes];
}
class RecipeInProgress extends RecipeState{
    
  
}
class RecipeFailure extends RecipeState{
 
}