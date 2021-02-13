import "package:flutter/material.dart";

import './ingredients_items.dart';
class IngredientsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return    Container(
                height: 150,
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
                    Text("Comments"),
                  ],
                ),
              );
  }
}