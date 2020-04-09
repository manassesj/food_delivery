import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/food_model.dart';
import 'package:food_delivery/src/scoped-model/main_model.dart';
import 'package:food_delivery/src/widgets/food_item_card.dart';
import 'package:scoped_model/scoped_model.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext contex, Widget child, MainModel model) {
          model.fetchFoods();
          List<Food> foods = model.foods;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: foods.map((food) {
                return FoodItemcard(
                  title: food.name,
                  price: food.price.toString(),
                  description: food.description,
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

//  Container(
//         padding: EdgeInsets.symmetric(horizontal: 16.0),
//         child: ScopedModelDescendant<MainModel>(
//           builder: (BuildContext contex, Widget child, MainModel model) {
//             model.fetchFoods();
//             List<Food> foods = model.foods;
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: foods.map((food) {
//                 return FoodItemcard(
//                   title: food.name,
//                   price: food.price.toString(),
//                   description: food.description,
//                 );
//               }).toList(),
//             );
//           },
//         ),
//       ),
