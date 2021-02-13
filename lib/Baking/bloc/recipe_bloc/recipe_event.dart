import 'package:baking_app/Baking/models/recipe.dart';
import 'package:equatable/equatable.dart';

abstract class RecipeEvent extends Equatable{
     const RecipeEvent();
}
class RecipeCreate extends RecipeEvent{
  final Recipe recipe;
  const RecipeCreate(this.recipe);


  @override
List<Object> get props => [recipe];
}
class RecipeRetrieve extends RecipeEvent{

  const RecipeRetrieve();

  @override
List<Object> get props => [];
}
class RecipeUpdate extends RecipeEvent{
  final Recipe recipe;
  const RecipeUpdate(this.recipe);

  @override
 List<Object> get props => [recipe];
}
class RecipeDelete extends RecipeEvent{
  final Recipe recipe;
  const RecipeDelete(this.recipe);

  @override
  List<Object> get props => [recipe];
}