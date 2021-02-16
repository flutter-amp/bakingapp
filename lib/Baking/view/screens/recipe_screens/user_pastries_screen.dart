import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_state.dart';
import 'package:baking_app/Baking/view/widgets/recipe_widgets/user_pastery_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPastriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Posts',style: TextStyle(color:Colors.black87),),backgroundColor: Color.fromRGBO(0, 0, 0, 0),elevation: 0,),
        body:BlocBuilder<RecipeBloc, RecipeState>(builder: (_, state) {
        if(state is RecipeFailure){
          return Text("not working");
        }
        else if(state is RecipeSuccessfull){
          final recipes=state.recipes;
           return SingleChildScrollView(
                  child: Container(
              color: Color.fromRGBO(125, 125, 125, 0.1),
              child: Column(
              children:  recipes.map((recipe) =>    UserPasteryItem(key: Key(recipe.id),recipe:recipe ,)).toList()
              )),
        );
       
        }
           return CircularProgressIndicator();
      }
 
      ),
        
        
        
        
        
    
      );
  }
}