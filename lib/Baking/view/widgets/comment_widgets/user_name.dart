import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
             Container(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: Colors.black38,
              child: Text(
                'AH',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Text("AHAHAHAHA"),
          ],),
         
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.edit,color:Colors.grey)
               
              ],
            ),
          )
        ],
      ),
    );
  }
}
