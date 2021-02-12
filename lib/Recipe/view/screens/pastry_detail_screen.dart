import 'package:flutter/material.dart';
import '../widgets/pastries_details_tabs.dart';



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
              
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
             
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/Spaghetti.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.arrow_back,size: 23,color: Colors.white,),onPressed: (){},),
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
                  fontSize: 16,
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
