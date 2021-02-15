import 'package:baking_app/Baking/bloc/comment_bloc/comment_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'comment_state.dart';

class CommentBlock extends Bloc<CommentEvent,CommentState>{
  CommentBlock(CommentState initialState) : super(initialState);

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async*{
    if(event is CommentRetrieve){
      yield CommentInProgress();
      try{
      //call
      yield CommentSuccessfull();
    }catch(_){
      yield CommentFailure();
    }
    }

    if(event is CommentCreate){
      try {
       // await courseRepository.createCourse(event.course);
       // final courses = await courseRepository.getCourses();
        yield CommentSuccessfull();
      } catch (_) {
        yield CommentFailure();
      }

    }
    if(event is CommentUpdate){
        try {
       // await courseRepository.updateCourse(event.course);
        //final courses = await courseRepository.getCourses();
        yield CommentSuccessfull();
      } catch (_) {
        yield CommentFailure();
      }
    }
    

  }
  
} 