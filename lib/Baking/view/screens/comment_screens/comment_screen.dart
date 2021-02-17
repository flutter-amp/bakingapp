import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_area.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_item.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CommentArea(),
          CommentList(),
        ],
      ),
    );
  }
}
