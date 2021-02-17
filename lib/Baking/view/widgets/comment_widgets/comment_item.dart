import 'package:baking_app/Baking/models/comment.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_text.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_user_name.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem({Key key, this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(20),
      child:Column(
        children:[
          CommentUserName(comment:comment),
          CommentText(message:comment.message),
        ]
      )
    );
  }







}