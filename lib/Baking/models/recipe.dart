

import 'ingredient.dart';

class Recipe{
  final String id;
  String name;
  int serving;
  String duration;
  String imageurl;
  List<Ingredient> ingredients;
  List<String> steps;
  Recipe(this.id,this.name,this.serving,this.duration,this.imageurl,this.ingredients,this.steps);
}