import 'package:baking_app/Recipe/models/ingredient.dart';

class Recipe{
  String name;
  int serving;
  String duration;
  String imageurl;
  List<Ingredient> ingredients;
  List<String> steps;
  Recipe(this.name,this.serving,this.duration,this.imageurl,this.ingredients,this.steps);
}