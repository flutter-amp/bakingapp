import 'package:baking_app/Baking/bloc/user_bloc/user_event.dart';
import 'package:baking_app/Baking/bloc/user_bloc/user_state.dart';
import 'package:baking_app/Baking/repository/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  final UserRepository userRepository;
  UserBloc({@required this.userRepository}):assert(userRepository!=null), super(UserInProgress());
  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{

    if(event is UserCreate){
       print('fired user create');

      try {
        await userRepository.createUser(event.user);
        //final comments = await commentRepository.getComments(event.comment.recipeid);
        yield UserSuccessfull();
      } catch (e) {
        print(e);
        print("hhhhhhht");
        yield UserFailure();
      }

    }

      if (event is UserDelete) {
      // try {
      //   int rid = event.comment.recipeid;
      //   await commentRepository.deleteComment(event.comment.id);
      //   final comments = await commentRepository.getComments(rid);
      //   yield CommentSuccessfull(comments);
      // } catch (_) {
      //   yield CommentFailure();
      // }
    }
    if(event is UserUpdate){
      //  int rid = event.comment.recipeid;
      //   print(rid);
      //   try {
      //   await commentRepository.updateComment(event.comment);
      //  final comments = await commentRepository.getComments(rid);
      //  print('fefefefefefefefefefeefe');
      //   yield CommentSuccessfull(comments);
      //   print('commne sucesssssss');
      // } catch (_) {
      //   yield CommentFailure();
      // }
    }
    

  }
  
} 