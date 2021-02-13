
import 'package:flutter/material.dart';

class PasteryItem extends StatelessWidget {
  Widget iconBuilder(String text, IconData data, BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: Icon(data,color: Theme.of(context).accentColor,),
        ),
        Text(text,style:TextStyle(color:Colors.grey[600])),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.only(top: 20,left:10),
      child: Ink(
      color: Colors.white,
              child: InkWell(
          onTap: () {},
          child: Container(
            height: 200,
            child: Row(children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                        width: 130,
                        child: Image.asset(
                          'cake.jpg',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Blueberry Cake',
                        style: TextStyle(
                          color:Color.fromRGBO(10, 56, 92, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    iconBuilder('${30} mins', Icons.schedule,context),
                    iconBuilder('${5} servings', Icons.people,context),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
