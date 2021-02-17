import 'package:baking_app/Baking/bloc/comment_bloc/comment_bloc.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_event.dart';
import 'package:baking_app/Baking/bloc/comment_bloc/comment_state.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:baking_app/Baking/bloc/recipe_bloc/recipe_event.dart';
import 'package:baking_app/Baking/view/widgets/comment_widgets/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CommentBloc>(context).add(CommentRetrieve(4));

    return BlocBuilder<CommentBloc, CommentState>(builder: (_, state) {
      if (state is CommentFailure) {
        return Text('Not Working');
      } else if (state is CommentSuccessfull) {
        print('commnetsssss commming');
        final comments = state.comments.reversed.toList();
        return (Container(
          child: Column(
            children: [...comments.map((comment)=>CommentItem(comment:comment)).toList()],
          ),
          // child: ListView.builder(
          //   itemCount: comments.length,
          //   itemBuilder: (context, index) {
          //     return CommentItem(comment:comments[index]);
          //   },
          // ),
        ));
      }
      return Center(child:CircularProgressIndicator());
    });
  }
}
