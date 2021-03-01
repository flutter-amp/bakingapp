import 'package:baking_app/Baking/bloc/authentication_boc/authentication_bloc.dart';
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_event.dart';
import 'package:baking_app/Baking/bloc/authentication_boc/authentication_state.dart';
import 'package:baking_app/Baking/bloc/user_bloc/user_bloc.dart';
import 'package:baking_app/Baking/bloc/user_bloc/user_event.dart';
import 'package:baking_app/Baking/models/user.dart';
import 'package:baking_app/Baking/view/widgets/user-widgets/user_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class UserProfileScreen extends StatefulWidget {
  static const routeName = 'userEdit';

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
   final formkey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  var user=User(username:'',password:'',email:'');

 void onSave(BuildContext context ){
    print("againnnnnnnnnnnnnnnnn");
    print(user.email);
    print(user.password);
    print(user.username);
    formkey.currentState.save();
    BlocProvider.of<UserBloc>(context).add(UserCreate(user));

     
     
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc,AuthenticationState>(builder: (context,state){
        if(state is AuthenticationAuthenticated){
          user.username=state.user.username;
           user.email=state.user.email;
            user.password=state.user.password;
            return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: ListView(
          children: <Widget>[
            // BackButtonWidget(),
            FlatButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: Colors.red)),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(UserLoggedOut());
                },
                //color: Theme.of(context).accentColor,
                textColor: Theme.of(context).accentColor,
                child: Text('Log Out')),
                Text('Hey! UserName',
                  style: Theme.of(context).textTheme.headline4),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.person), onPressed: null),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            
                            decoration: InputDecoration(
                              hintText: 'Username',
           
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(247, 102, 94, 1)),
                              ),
                            ),
                          onSaved: (value) {
                    user.username = value;
                  },
                            validator: (String value) {
                              if (value.length < 5) {
                                return 'Username must be atleast 5 characters long';
                              }
                              return null;
                            },
                          )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.mail), onPressed: null),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                             onSaved: (value) {
                    user.email = value;
                  },
                            decoration: InputDecoration(
                              hintText: 'Email',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(247, 102, 94, 1)),
                              ),
                            ),
                            validator: (String value) {
                             
                              return null;
                            },
                          )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.lock), onPressed: null),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            controller: _pass,
                             onSaved: (value) {
                    user.password = value;
                  },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(247, 102, 94, 1)),
                              ),
                            ),
                            validator: (String value) {
                              if (value.length < 5) {
                                return 'Password must be atleast 5 characters long';
                              }
                              return null;
                            },
                          )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.lock), onPressed: null),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            controller: _confirmPass,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(247, 102, 94, 1)),
                              ),
                            ),
                            validator: (String value) {
                              if (value.length < 5) {
                                return 'Password must be atleast 5 characters long';
                              }
                              if (value != _pass.text) {
                                return 'Password must match';
                              }
                              return null;
                            },
                          )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 60,
                  child: RaisedButton(
                    onPressed: () {
                      bool valid = formkey.currentState.validate();
                      // ignore: unnecessary_statements
                      valid?onSave(context):(){};
                    },
                    color: Color.fromRGBO(247, 102, 94, 1),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              child:Text('Log in'),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
        }
        else{
          return Text('Not auth');
        }

    });
  }
}
