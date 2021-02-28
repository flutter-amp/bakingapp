import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/sign.jpg'))),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                  IconButton(icon: Icon(Icons.lock), onPressed: null),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            obscureText: true,
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
                          ))),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 60,
                  child: RaisedButton(
                    onPressed: () {
                      formkey.currentState.validate();
                    },
                    color: Color.fromRGBO(247, 102, 94, 1),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'SignUp');
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'SIGN UP',
                          style: TextStyle(
                              color: Color.fromRGBO(247, 102, 94, 1),
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
