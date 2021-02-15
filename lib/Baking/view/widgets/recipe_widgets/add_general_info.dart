import 'package:baking_app/Baking/models/recipe.dart';
import 'package:flutter/material.dart';


class AddGeneralInfo extends StatefulWidget {

  final Recipe recipe;

  const AddGeneralInfo( this.recipe);
  @override
  _AddGeneralInfoState createState() => _AddGeneralInfoState();
}

class _AddGeneralInfoState extends State<AddGeneralInfo> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
   
          TextFormField(
            decoration: InputDecoration(labelText: 'Recipe Name'),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_priceFocusNode);
            },
            onSaved: (value){
              print("here");
               widget.recipe.title=value;
          
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Servings'),
          
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            focusNode: _priceFocusNode,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_descriptionFocusNode);
            },
              onSaved: (value){
              widget.recipe.servings=int.parse(value);
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Duration'),
            focusNode: _descriptionFocusNode,
            keyboardType: TextInputType.text,
              onSaved: (value){
              widget.recipe.duration=value;
            },
          ),
          Row(children: <Widget>[
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: 8, right: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: _imageController.text.isEmpty
                  ? Text("Enter a URL")
                  : FittedBox(
                      child: Image.asset(_imageController.text),
                      fit: BoxFit.cover,
                    ),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                keyboardType: TextInputType.url,
                controller: _imageController,
                textInputAction: TextInputAction.done,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
