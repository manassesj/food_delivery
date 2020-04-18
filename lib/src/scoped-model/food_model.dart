import 'dart:convert';

import 'package:food_delivery/src/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  List<Food> get foods {
    return List.from(_foods);
  }

  Future<bool> addFood(Food food) async {
    _isLoading = true;
    notifyListeners();
    try {
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

      _foods.add(foodWithId);
      notifyListeners();
      return Future.value(true);
    } catch (err) {
      notifyListeners();
      return Future.value(false);

      // print('Connection erro' + err);
    }
  }

  Future<bool> fetchFoods() async {
    _isLoading = true;
    notifyListeners();
    try {
      final http.Response response =
          await http.get("https://foodapp-6872d.firebaseio.com/foods.json");

      final Map<String, dynamic> fetchedData = json.decode(response.body);

      final List<Food> foodItems = [];

      fetchedData.forEach((String id, dynamic foodData) {
        Food foodItem = Food(
          id: id,
          name: foodData['title'],
          description: foodData['descrioption'],
          category: foodData['category'],
          price: foodData['price'],
          discount: foodData['discount'],
        );

        foodItems.add(foodItem);
      });

      _foods = foodItems;
      _isLoading = false;
      notifyListeners();
      return Future.value(true);

    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }
}
