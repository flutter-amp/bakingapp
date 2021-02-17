import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_event.dart';
import 'package:baking_app/Baking/models/comment.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentUserName extends StatelessWidget {
  final Comment comment;


  const CommentUserName({Key key,this.comment }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: Text(
                    'AH',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Text(comment.username),
            ],
          ),
          Container(child: CommentPopupMenu(comment: comment,))
        ],
      ),
    );
  }





 
}
