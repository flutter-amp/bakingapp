import "package:flutter/material.dart";

class AddIngredientItem extends StatefulWidget {

  @override
  _AddIngredientItemState createState() => _AddIngredientItemState();
}

class _AddIngredientItemState extends State<AddIngredientItem> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'One';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,),
      child: Container(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                   
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 24),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                width: 100,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Quantity'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
