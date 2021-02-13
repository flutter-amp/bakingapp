import 'package:flutter/material.dart';

import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_directions.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_ingredients.dart';
import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_general_info.dart';


class AddRecipeScreen extends StatefulWidget {
  static const routeName = 'recipeAdd';
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageController = TextEditingController();
  final _form = GlobalKey<FormState>();


  var _recipe = Recipe(null,0,"",null,List<Ingredient>(),List<String>());
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void onSave() {
    _form.currentState.save();
    print(_recipe.name);
    print(_recipe.steps[0]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add Recipe"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _form,
            child: ListView(children: <Widget>[
              Row(children: [
                Text(
                  "General Information",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Divider()),
              ]),
              AddGeneralInfo(_recipe),
              SizedBox(height: 20),
              AddIngredients(),
              SizedBox(height: 20),
              AddDirections(_recipe),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  onSave();
                },
                child: Text("Done"),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
