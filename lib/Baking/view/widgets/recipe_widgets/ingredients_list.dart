import 'package:baking_app/Baking/models/ingredient.dart';
import "package:flutter/material.dart";

import './ingredients_items.dart';

class IngredientsList extends StatelessWidget {
  final List<Ingredient> ingredients;

  const IngredientsList(this.ingredients);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: ingredients
              .map((ingredient) => IngredientItem(key:Key(ingredient.id.toString()),ingredient:ingredient))
              .toList()),
    );
  }
}
