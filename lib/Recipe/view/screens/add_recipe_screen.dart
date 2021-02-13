import 'package:flutter/material.dart';
import '../widgets/add_general_info.dart';
import '../widgets/add_ingredients.dart';



class AddRecipeScreen extends StatefulWidget {
  static const routeName = '/addProduct';
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

    return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: Text("Add Recipe"),
        ),
        body: Padding(
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
