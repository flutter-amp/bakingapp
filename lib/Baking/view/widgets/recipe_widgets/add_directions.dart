import 'package:baking_app/Baking/models/recipe.dart';
import 'package:flutter/material.dart';
import './add_direction.dart';


class AddDirections extends StatefulWidget {
  final Recipe recipe;

  const AddDirections(this.recipe);
  @override
  _AddDirectionsState createState() => _AddDirectionsState();
}

class _AddDirectionsState extends State<AddDirections> {
  @override
  List<Widget> list = new List();
  @override
  void initState() {
    super.initState();
    list.add(AddDirectionItem(1,widget.recipe));
  }

  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text(
            "Add Directions",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(child: Divider()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                list.add(AddDirectionItem(list.length + 1,widget.recipe));
              });
            },
          ),
        ],
      ),
      ...list.toList(),
    ]);
  }
}
