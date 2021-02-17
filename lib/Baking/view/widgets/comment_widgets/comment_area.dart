import 'package:flutter/material.dart';

class CommentArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
         Container(
           decoration: BoxDecoration(
              color: Colors.grey[300],
             borderRadius: BorderRadius.all(Radius.circular(10)),
           ),
              
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(17),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration.collapsed(hintText: "Enter your comment here"),
              ),
            )
          ,
            Container(
              padding:EdgeInsets.only(right:20),
              alignment: AlignmentDirectional.topEnd,
              child: FlatButton(
                height: 40,
                shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(25),
  side: BorderSide(color: Colors.red)
),
                  onPressed: () {},
                //  color: Theme.of(context).accentColor,
                  textColor: Colors.black87,
                  child: Text('Comment')),
            )
        ],
      );
  }
}