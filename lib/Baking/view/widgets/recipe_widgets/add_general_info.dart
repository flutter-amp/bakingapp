import 'dart:io';

import 'package:baking_app/Baking/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';



class AddGeneralInfo extends StatefulWidget {

  final Recipe recipe;
   File file;
   final bool add;

   AddGeneralInfo( this.add,this.recipe,this.file);
  @override
  _AddGeneralInfoState createState() => _AddGeneralInfoState();
}

class _AddGeneralInfoState extends State<AddGeneralInfo> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
      print("jump");
        widget.recipe.imageurl =pickedFile.path;
        print("path "+pickedFile.path);
        print("jump");
        _image=File(pickedFile.path);
        widget.recipe.image =File(pickedFile.path);
        print("jump");
          widget.file=_image;
      } else {
        print('No image selected.');

      }
    });
  }
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
            initialValue: widget.recipe.title,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_priceFocusNode);
            },
            onSaved: (value){
              print("here");
               widget.recipe.title=value;
          
            },
          ),
             SizedBox(height:10),
          TextFormField(
            decoration: InputDecoration(labelText: 'Servings'),
          
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            focusNode: _priceFocusNode,
            initialValue: widget.recipe.servings.toString(),
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_descriptionFocusNode);
            },
              onSaved: (value){
              widget.recipe.servings=int.parse(value);
            },
          ),
             SizedBox(height:10),
          TextFormField(
            decoration: InputDecoration(labelText: 'Duration'),
            focusNode: _descriptionFocusNode,
             initialValue: widget.recipe.duration,
            keyboardType: TextInputType.text,
              onSaved: (value){
              widget.recipe.duration=value;
            
            },
          ),
          SizedBox(height:10),
          Row(children: <Widget>[
            Container(
              width: 200,
              height: 150,
              margin: EdgeInsets.only(top: 8, right: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: _image==null
                  ? Icon(Icons.camera_alt_outlined,size: 150.0,)
                  : FittedBox(
                      child: Image.file(_image),
                      fit: BoxFit.cover,
                    ),
            ),
            TextButton(onPressed: getImage, child: Text("Choose")),
          ])
        ],
      ),
    );
  }
}
