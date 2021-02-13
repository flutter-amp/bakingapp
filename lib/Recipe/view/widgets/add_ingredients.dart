import 'package:flutter/material.dart';
import './add_ingredient_item.dart';
class AddIngredients extends StatefulWidget {
  @override
  _AddIngredientsState createState() => _AddIngredientsState();
}

class _AddIngredientsState extends State<AddIngredients> {
  @override
  List<Widget>list = new List();
 @override
 void initState(){
   super.initState();
 list.add(AddIngredientItem());
 }
  Widget build(BuildContext context) {
    
    return Column(
    
      children:[ 
       Padding(
         padding: const EdgeInsets.only(top:8.0),
         child: Text("Add Ingredients"),
       ),
      Divider(),
        ...list.toList(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0,vertical:10),
          child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
          IconButton(icon: Icon(Icons.add),onPressed: (){
            setState(() {
              list.add(AddIngredientItem());
            });
          },),
          ],
      ),
        ),
      ]
    );
  }
}