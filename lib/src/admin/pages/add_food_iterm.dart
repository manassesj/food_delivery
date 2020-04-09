import 'package:flutter/material.dart';
import 'package:food_delivery/src/models/food_model.dart';
import 'package:food_delivery/src/scoped-model/main_model.dart';
import 'package:food_delivery/src/widgets/button.dart';
import 'package:scoped_model/scoped_model.dart';

class AddFoodItem extends StatefulWidget {
  @override
  _AddFoodItemState createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  String titile;
  String category;
  String description;
  String price;
  String discount;

  GlobalKey<FormState> _foodItemFormKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldStateKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 16.0),
/*           width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height, */
          child: Form(
            key: _foodItemFormKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 170.0,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    //color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/noimage.png'),
                    ),
                  ),
                ),
                _buildTextFormField('Food Title'),
                _buildTextFormField('Category'),
                _buildTextFormField('Descripition', maxLine: 3),
                _buildTextFormField('Price'),
                _buildTextFormField('Discount'),
                SizedBox(
                  height: 50.0,
                ),
                ScopedModelDescendant(
                  builder:
                      (BuildContext contex, Widget child, MainModel model) {
                    return GestureDetector(
                      onTap: () {
                        onSubmit(model.addFood);
                        if (model.isLoading) {
                          // show Loading progess indicator
                          showLoadingInficator();
                        }
                      },
                      child: Button(
                        text: 'Submit',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit(Function addFood) async {
    if (_foodItemFormKey.currentState.validate()) {
      _foodItemFormKey.currentState.save();

      final Food food = Food(
        name: titile,
        category: category,
        description: description,
        discount: double.parse(discount),
        price: double.parse(price),
      );

      bool value = await addFood(food);
      if (value) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text('Food item successfully added'),
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      } else {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(
          content: Text('Fail to add food item'),
        );
        _scaffoldStateKey.currentState.showSnackBar(snackBar);
      }
    }
    ;
  }

  Future<void> showLoadingInficator() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext contex) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Adding food item...',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextFormField(String hint, {int maxLine = 1}) {
    return TextFormField(
      decoration: InputDecoration(hintText: '$hint'),
      maxLines: maxLine,
      keyboardType: hint == 'Price' || hint == 'Discount'
          ? TextInputType.number
          : TextInputType.text,
      validator: (String value) {
        if (value.isEmpty && hint == 'Food Title') {
          return 'food title required';
        }
        if (value.isEmpty && hint == 'Category') {
          return 'Category required';
        }
        if (value.isEmpty && hint == 'Descripition') {
          return 'Descripition required';
        }
        if (value.isEmpty && hint == 'Price') {
          return 'Price required';
        }
      },
      onChanged: (String value) {
        if (hint == 'Food Title') {
          this.titile = value;
        }
        if (hint == 'Category') {
          this.category = value;
        }
        if (hint == 'Descripition') {
          this.description = value;
        }
        if (hint == 'Price') {
          this.price = value;
        }
        if (hint == 'Discount') {
          this.discount = value;
        }
      },
    );
  }
}
