import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/food_model.dart';
import 'package:food_delivery/src/widgets/bought_foods.dart';
import 'package:food_delivery/src/widgets/food_category.dart';
import 'package:food_delivery/src/widgets/home_top_info.dart';
import 'package:food_delivery/src/widgets/search_field.dart';

//Data
import 'package:food_delivery/src/data/food_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Food> _foods = foods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(
            height: 13.0,
          ),
          SearchField(),
          SizedBox(
            height: 13.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Frequently bought foods',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'View all',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent),
                ),
              )
            ],
          ),
          SizedBox(height: 13.0,),
          Column(
            children: _foods.map(_buildFoodItems).toList()
          )
        ],
      ),
    );
  }

  Widget _buildFoodItems (Food food){
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: BoughtFoods(
        id: food.id,
        name: food.name,
        imagePath: food.imagePath,
        category: food.category,
        rating: food.rating,
        discount: food.discount,
        price: food.price,
      ),
    );
  }

}
