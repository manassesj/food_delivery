import 'package:flutter/material.dart';
import 'package:food_delivery/src/widgets/button.dart';

class AddFoodItem extends StatefulWidget {
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 16.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                height: 170.0,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 20.0),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              _buildTextFormField('Food Title'),
              _buildTextFormField('Category'),
              _buildTextFormField('Descripition', maxLine: 3),
              _buildTextFormField('Price'),
              _buildTextFormField('Discount'),
              SizedBox(
                height: 84.0,
              ),
              Button(
                text: 'Submit',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String hint, {int maxLine = 1}) {
    return TextFormField(
      decoration: InputDecoration(hintText: '$hint'),
      maxLines: maxLine,
      keyboardType: hint == 'Price' || hint == 'Discount'
          ? TextInputType.number
          : TextInputType.text,
    );
  }
}
