import 'package:flutter/material.dart';
import '../../../models/recipe.dart';
class AddDirectionItem extends StatelessWidget {
  final int step;
 final Recipe recipe;

  const AddDirectionItem( this.step,this.recipe) ;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          child: TextFormField(
            decoration: InputDecoration(labelText: 'Step $step'),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.multiline,
            minLines: 2,
            maxLines: 5,
            onSaved: (value){
              print("value "+value);
              // recipe.steps.add(value);
            },
          ),
        ),
      ],
    ));
  }
}
