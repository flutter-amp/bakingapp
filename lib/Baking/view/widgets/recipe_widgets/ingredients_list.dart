import 'package:baking_app/Baking/view/screens/comment_screens/comment_screen.dart';
import "package:flutter/material.dart";

import './ingredients_items.dart';
class IngredientsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return    Container(
                height: 400,
                child: TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Column(children: [
                        IngredientItems(),
                        IngredientItems(),
                        IngredientItems(),
                        IngredientItems(),
                      ]),
                    ),
                    Text("directions"),
                    CommentScreen(),
                  ],
                ),
              );
  }
}