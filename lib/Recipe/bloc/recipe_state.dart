import 'package:baking_app/Recipe/models/recipe.dart';

abstract class RecipeState{


}
class RecipeSuccess extends RecipeState{
  final Recipe recipe;
  RecipeSuccess(this.recipe);

}
class RecipeInProgress extends RecipeState{

}
class RecipeFailure extends RecipeState{

}
