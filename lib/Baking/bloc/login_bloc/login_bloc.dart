import 'package:baking_app/Baking/bloc/authentication_boc/authentication_bloc.dart';
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_event.dart';
import 'package:baking_app/Baking/repository/authentication/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationRepository _authenticationRecipe;

  LoginBloc(AuthenticationBloc authenticationBloc, AuthenticationRepository authenticationRecipe)
      : assert(authenticationBloc != null),
        assert(authenticationRecipe != null),
        _authenticationBloc = authenticationBloc,
        _authenticationRecipe = authenticationRecipe,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    try {
      final user = await _authenticationRecipe.signInWithEmailAndPassword(event.email, event.password);
      if (user != null) {
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccess();
        yield LoginInitial();
      } else {
        yield LoginFailure(error: 'Something very weird just happened');
      }
    } on Exception catch (e) {
      yield LoginFailure(error: "");
    } catch (err) {
      yield LoginFailure(error: err.message ?? 'An unknown error occured');
    }
  }
}