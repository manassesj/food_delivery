import 'package:flutter/material.dart';
import 'package:food_delivery/src/pages/signup_page.dart';
import 'package:food_delivery/src/widgets/button.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _toggleVisibility = true;

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Your email or username',
          hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 18.0)),
    );
  }

  Widget _buildPassWordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(color: Color(0xFFBDC2CB), fontSize: 18.0),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon: _toggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sign In',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Forgotten Password?',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(
                      height: 15.0,
                    ),
                    _buildPassWordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Button(
              text: 'Sign In',
            ),
            Divider(
              height: 25.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text("Don't have a account?"),
              SizedBox(
                width: 10.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => SignUpPage()));
                },
                child: Text(
                  "Sign up",
                  style: TextStyle(color: Colors.blue, fontSize: 14.0),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
