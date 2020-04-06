import 'package:flutter/material.dart';
import 'package:food_delivery/src/widgets/custom_list_tile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool turnOnNotification = false;
  bool turnOnNoLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Profile',
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(0, 4.0),
                            color: Colors.black38)
                      ],
                      image: DecorationImage(
                          image: AssetImage('assets/images/breakfast.jpeg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Richmond Blankson',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '+21654651356',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 25.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.blue)),
                        child: Center(
                          child: Text(
                            'Edit',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 16.0),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Account',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(children: <Widget>[
                    CustomListTile(
                      icon: Icons.location_on,
                      text: 'Location',
                    ),
                    Divider(height: 15.0, color: Colors.grey),
                    CustomListTile(
                      icon: Icons.visibility,
                      text: 'Change Passowrd',
                    ),
                    Divider(height: 15.0, color: Colors.grey),
                    CustomListTile(
                      icon: Icons.shopping_cart,
                      text: 'Shipping',
                    ),
                    Divider(height: 15.0, color: Colors.grey),
                    CustomListTile(
                      icon: Icons.payment,
                      text: 'Payment',
                    ),
                    Divider(height: 15.0, color: Colors.grey),
                  ]),
                ),
              ),
              SizedBox(
                height: 19.0,
              ),
              Text(
                'Notification',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 19.0,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'App Notification',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Switch(
                            value: turnOnNotification,
                            onChanged: (bool value) {
                              setState(() {
                                turnOnNotification = value;
                              });
                            },
                          )
                        ],
                      ),
                      Divider(height: 15.0, color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Location Tracking',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Switch(
                            value: turnOnNoLocation,
                            onChanged: (bool value) {
                              setState(() {
                                turnOnNoLocation = value;
                              });
                            },
                          )
                        ],
                      ),
                      Divider(height: 15.0, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 19.0,
              ),
              Text(
                'Other',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 19.0,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Language',
                            style: TextStyle(
                              fontSize: 16.0,
                            )),
                        Divider(height: 30.0, color: Colors.grey),
                        Text('Currency',
                            style: TextStyle(
                              fontSize: 16.0,
                            )),
                        Divider(height: 25.0, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
