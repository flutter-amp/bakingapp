import 'package:baking_app/Baking/models/recipe.dart';
import 'package:flutter/material.dart';

import './ingredients_list.dart';


class PastriesDetailsTabs extends StatefulWidget {
  final Recipe recipe;

  const PastriesDetailsTabs( this.recipe);
  @override
  _PastriesDetailsTabsState createState() => _PastriesDetailsTabsState();
}

class _PastriesDetailsTabsState extends State<PastriesDetailsTabs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: TabBar(
                  labelColor: Colors.red[300],
                  indicatorColor: Colors.red[300],
                  tabs: <Widget>[
                    Tab(
                      iconMargin: EdgeInsets.all(4),
                      // icon: Icon(
                      //   Icons.subject,
                      //   size: 18,
                      //   color: Colors.purple,
                      // ),
                      text: "Ingredients",
                    ),
                    Tab(
                      iconMargin: EdgeInsets.all(4),
                      // icon: Icon(
                      //   Icons.directions,
                      //   size: 18,
                      //   color: Colors.purple,
                      // ),
                      text: "Directions",
                    ),
                    Tab(
                      iconMargin: EdgeInsets.all(4),
                      // icon: Icon(
                      //   Icons.comment,
                      //   size: 18,
                      //   color: Colors.purple,
                      // ),
                      text: "Comments",
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                child: TabBarView(
                  children: <Widget>[
              IngredientsList(widget.recipe.ingredients),
            Column(children:widget.recipe.steps.map((step) => Text(step)).toList()),
            Text("comment"), 
                  ])),
            ],
          ),
        ),
      ]),
    );
  }
}
