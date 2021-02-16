import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import "package:flutter/material.dart";

class AddIngredientItem extends StatefulWidget {
  final Recipe recipe;

  const AddIngredientItem(this.recipe);
  @override
  _AddIngredientItemState createState() => _AddIngredientItemState();
}

class _AddIngredientItemState extends State<AddIngredientItem> {
  String dropdownValue = 'Measurment';
  String name = "";
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: TextFormField(
                    key: Key(name),
                    decoration: InputDecoration(labelText: 'Name'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      print(value);

                      setState(() {
                        name = value;
                      });

                  
                    },
                  ),
                ),
              ),
              SizedBox(width:10),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: 24),
                  child: DropdownButton<String>(
                    hint: Text("Measurment"),
                    itemHeight: 50,
                    key: Key(dropdownValue),
                    value: dropdownValue,
                   
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>["Measurment",'g', 'ml', 'cup', 'ltr']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
                 SizedBox(width:10),
              Expanded(
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Quantity'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      try {
                        setState(() {
                          quantity = int.parse(value);
                        });
                      } catch (_) {}
                    },
                    onSaved: (newValue) => widget.recipe.ingredients
                        .add(Ingredient(DateTime.now().toString(),name, quantity, dropdownValue)),
                  ),
                ),
              ),

            ],
          ),
        ],
      )),
    );
  }
}
