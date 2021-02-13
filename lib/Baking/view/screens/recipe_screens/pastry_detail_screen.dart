import 'package:baking_app/Baking/view/widgets/recipe_widgets/pastries_details_tabs.dart';
import 'package:flutter/material.dart';


class PastryDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Baker'),
        //   backgroundColor: Color.fromRGBO(10, 10, 10, 1),
        // ),
        body: Column(
          children: <Widget>[
            Container(
              child: Stack(alignment: Alignment.topLeft, children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(30)),
                    child: Image.asset(
                      "assets/images/Spaghetti.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical:20, horizontal:15),
                    child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 29,
                vertical: 10,
              ),
              child: Text(
                "Stawberry And cherry pancakes with Honey Maple syrup",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            PastriesDetailsTabs(),

            // PastriesDetailsTabs(),
          ],
        ),
      ),
    );
  }
}
