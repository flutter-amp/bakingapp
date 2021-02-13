import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_directions.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_general_info.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_ingredients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void onSave(BuildContext context ){
    _form.currentState.save();
    print(_recipe.name);
    print(_recipe.steps[0]);
     BlocProvider.of<RecipeBloc>(context).add(RecipeCreate(_recipe));
     
     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Add Recipe',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
      ),
      body: Container(
        color: Color.fromRGBO(125, 125, 125, 0.1),
        child: Padding(
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
                    onSave(context);
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
