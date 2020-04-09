import 'package:flutter/material.dart';
import 'package:food_delivery/src/widgets/small_button.dart';

class FoodItemcard extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const FoodItemcard(
      {this.title, this.description,this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 130.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 5.5, offset: Offset(0, 2.5), color: Colors.black12)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/breakfast.jpeg'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('$description'),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 200.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '\u{20b5} $price',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    SmallButton('Buy')
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
