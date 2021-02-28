import 'dart:io';

import 'package:baking_app/Baking/bloc/ingredient_bloc/ingredient.state.dart';
import 'package:baking_app/Baking/bloc/ingredient_bloc/ingredient_bloc.dart';
import 'package:baking_app/Baking/bloc/ingredient_bloc/ingredient_event.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_state.dart';
import 'package:baking_app/Baking/bloc/recipe_state/step.state.dart';
import 'package:baking_app/Baking/bloc/recipe_state/step_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_state/step_event.dart';
import 'package:baking_app/Baking/models/ingredient.dart';
import 'package:baking_app/Baking/models/recipe.dart';
import 'package:baking_app/Baking/models/recipe_step.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_directions.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_general_info.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/add_ingredients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../baking_route.dart';

class AddRecipeScreen extends StatefulWidget {
  static const routeName = 'recipeAdd';
  final RecipeArgument args;

  const AddRecipeScreen(this.args);
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _recipe;

  @override
  void initState() {
    // TODO: implement initState
    _recipe = widget.args.add
        ? Recipe(
            title: null,
            servings: 0,
            duration: null,
            ingredients: List<Ingredient>(),
            steps: List<RecipeStep>(),
            imageurl: null)
        : widget.args.recipe;
    super.initState();
  }
  // var _recipe = Recipe(DateTime.now().toString(),null,0,"",null,List<Ingredient>(),List<String>(),);

  File _file;
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();

    super.dispose();
  }

  void onSave(BuildContext context) {
    print("again");
    _form.currentState.save();
    print("again again");
    print(_recipe.title);
    //  print(_recipe.steps[0]);
    //  print("name 3 "+_recipe.ingredients[0].name);
    //  BlocProvider.of<RecipeBloc>(context).add(RecipeCreate(_recipe));
    //   _form.currentState.save();
    // print(_recipe.name);
    // print(_recipe.steps[0]);
    if (widget.args.add) {
      BlocProvider.of<RecipeBloc>(context).add(RecipeCreate(_recipe, _file));
      _recipe = {};
    } else {
      BlocProvider.of<RecipeBloc>(context).add(RecipeUpdate(_recipe));
    }
  }

  @override
  Widget build(BuildContext context) {
      BlocProvider.of<IngredientBloc>(context).add(IngredientsRetrieve(_recipe.id));
            BlocProvider.of<StepBloc>(context).add(StepsRetrieve(_recipe.id));
    final bool add = widget.args.add;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          add ? 'Add Recipe' : 'Edit Recipe',
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
              AddGeneralInfo(add, _recipe, _file),
              SizedBox(height: 20),
              widget.args.add
                  ? AddIngredients(_recipe)
                  : BlocBuilder<IngredientBloc, IngredientState>(
                      builder: (_, state) {
                      if (state is IngredientSuccessfull) {
                        var ingredients = state.ingredients;
                        _recipe.ingredients = ingredients;
                        return AddIngredients(_recipe);
                      } else if (state is IngredientInProgress)
                        return CircularProgressIndicator();
                    }),
              SizedBox(height: 20),
            
               widget.args.add
                  ? AddIngredients(_recipe)
                  : BlocBuilder<StepBloc, RecipeStepState>(
                      builder: (_, state) {
                      if (state is StepSuccessfull) {
                        var steps = state.steps;
                       

                        _recipe.steps = steps;
                        return AddDirections(_recipe);
                      } else if (state is StepInProgress)
                        return CircularProgressIndicator();
                    }),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  onSave(context);
                },
                child: Row(children: [
                  Text("Done"),
                  BlocBuilder<RecipeBloc, RecipeState>(builder: (_, state) {
                    if (state is RecipeInProgress) {
                      return CircularProgressIndicator();
                    }
                    return Container();
                  }),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
