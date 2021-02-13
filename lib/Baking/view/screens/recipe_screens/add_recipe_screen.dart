import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_general_info.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_ingredients.dart';
import 'package:flutter/material.dart';

class AddRecipeScreen extends StatefulWidget {
  static const routeName = 'recipeAdd';
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageController = TextEditingController();
  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageController.dispose();
    super.dispose();
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
            child: ListView(children: <Widget>[
              AddGeneralInfo(),
              AddIngredients(),
            ]),
          ),
        ),
      ),
    );
  }
}
