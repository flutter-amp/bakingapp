import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
    static const routeName = 'userEdit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        elevation: 0,
      ),
      body: Container(
        color: Color.fromRGBO(125, 125, 125, 0.1),
        child:Text('test'),
      ),
    );
  }
}
