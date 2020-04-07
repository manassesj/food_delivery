import 'dart:convert';

import 'package:food_delivery/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];

  List<Food> get foods {
    return List.from(_foods);
  }

  void addFood(Food food) async {
    final Map<String, dynamic> foodData = {
      'title': food.name,
      'descrioption': food.description,
      'category': food.category,
      'price': food.price,
      'discount': food.discount
    };
    final http.Response response = await http.post(
        'https://foodapp-6872d.firebaseio.com/foods.json',
        body: json.encode(foodData));

    final Map<String, dynamic> responseData = json.decode(response.body);

    Food foodWithId = Food(
        id: responseData['name'],
        name: food.name,
        description: food.description,
        category: food.category,
        discount: food.discount,
        price: food.price);

    _foods.add(food);
  }

  void fetchFoods() {
    http
        .get("https://foodapp-6872d.firebaseio.com/foods.json")
        .then((http.Response response) {
      final List fetchedData = json.decode(response.body);
      final List<Food> fetchedFoodItems = [];
      fetchedData.forEach((data) {
        Food food = Food(
            id: data['id'],
            category: data['category_id'],
            discount: double.parse(data['discount']),
            imagePath: data['imagepath'],
            name: data['title'],
            price: double.parse(data['price']));
        fetchedFoodItems.add(food);
      });
      _foods = fetchedFoodItems;
      print(_foods);
    });
  }
}
