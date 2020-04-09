import 'package:flutter/material.dart';
import 'package:food_delivery/src/admin/pages/add_food_iterm.dart';

//pages
import 'package:food_delivery/src/pages/home_page.dart';
import 'package:food_delivery/src/pages/order_page.dart';
import 'package:food_delivery/src/pages/explore_page.dart';
import 'package:food_delivery/src/pages/profile_page.dart';
import 'package:food_delivery/src/scoped-model/main_model.dart';

class MainScreen extends StatefulWidget {
  final MainModel mainModel;

  MainScreen({this.mainModel});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;

  List<Widget> pages;
  Widget currentPage;

  HomePage homePage;
  OrderPage orderPage;
  ExplorePage explorePage;
  ProfilePage profilePage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //call the fetch methods on food
    widget.mainModel.fetchFoods();
    homePage = HomePage();
    orderPage = OrderPage();
    explorePage = ExplorePage();
    profilePage = ProfilePage();

    pages = [homePage, explorePage, orderPage, profilePage];

    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AddFoodItem()));
                },
                leading: Icon(Icons.add),
                title: Text(
                  'Add food Item',
                  style: TextStyle(fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTabIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                currentTabIndex = index;
                currentPage = pages[index];
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), title: Text('Explore')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), title: Text('Orderns')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Profile')),
            ]),
        body: currentPage,
      ),
    );
  }
}
