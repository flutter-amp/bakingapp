import 'package:flutter/material.dart';
import './add_ingredient_item.dart';

class AddIngredients extends StatefulWidget {
  @override
  _AddIngredientsState createState() => _AddIngredientsState();
}

class _AddIngredientsState extends State<AddIngredients> {
  @override
  List<Widget> list = new List();
  @override
  void initState() {
    super.initState();
    list.add(AddIngredientItem());
  }

  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text(
            "Add Ingredients",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Divider()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                list.add(AddIngredientItem());
              });
            },
          ),
        ],
      ),
      ...list.toList(),
    ]);
  }
}
