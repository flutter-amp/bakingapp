import 'package:flutter/material.dart';

import './ingredients_list.dart';


class PastriesDetailsTabs extends StatefulWidget {
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
                  labelColor: Colors.indigo,
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
           IngredientsList(),
            ],
          ),
        ),
      ]),
    );
  }
}
