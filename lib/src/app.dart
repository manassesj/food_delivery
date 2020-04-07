import 'package:flutter/material.dart';
import 'package:food_delivery/src/admin/pages/add_food_iterm.dart';
import 'package:food_delivery/src/scoped-model/main_model.dart';

import 'package:food_delivery/src/screens/main_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {
  final MainModel mainModel = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food Delivery App",
        theme: ThemeData(primaryColor: Colors.blueAccent),
        //home: MainScreen(mainModel: mainModel),
        home: AddFoodItem(),
      ),
    );
  }
}
