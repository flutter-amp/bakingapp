import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_text.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/user_name.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(20),
      child:Column(
        children:[
          UserName(),
          CommentText(),
          Container(alignment:Alignment.topRight,child: Icon(Icons.delete_forever,color:Colors.red)),
        ]
      )
    );
  }
}