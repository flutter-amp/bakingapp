import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_event.dart';
import 'package:baking_app/Baking/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentArea extends StatefulWidget {
  @override
  _CommentAreaState createState() => _CommentAreaState();
}

class _CommentAreaState extends State<CommentArea> {
  var comment = Comment(message: '', userid: 5, recipeid: 4, username: 'usr');
  final _form = GlobalKey<FormState>();

  void onSave(BuildContext context) {

    _form.currentState.save();
    print(comment.toString());
    BlocProvider.of<CommentBloc>(context).add(CommentCreate(comment));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(17),
              child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration.collapsed(
                      hintText: "Enter your comment here"),
                  onSaved: (value) {
                    print("here");
                    comment.message = value;
                  }),
            ),
            Container(
              padding: EdgeInsets.only(right: 20),
              alignment: AlignmentDirectional.topEnd,
              child: FlatButton(
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.red)),
                  onPressed: () {onSave(context);},
                  //  color: Theme.of(context).accentColor,
                  textColor: Colors.black87,
                  child: Text('Comment')),
            )
          ],
        ),
      ),
    );
  }
}
