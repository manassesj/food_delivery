import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Profile',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
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
                SizedBox(width: 15.0,),
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
                    Text('+21654651356' , style: TextStyle(color: Colors.grey),),
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
                          style: TextStyle(color: Colors.blue, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
