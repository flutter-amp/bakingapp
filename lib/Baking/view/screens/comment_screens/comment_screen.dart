import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_area.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_item.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    
          child: Column(
        children: [
          CommentArea(),
          CommentItem(),
          CommentItem(),
          CommentItem(),
        ],
      ),
    );
  }
}