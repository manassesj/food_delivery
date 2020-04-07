import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;

  Button({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(25.0)),
      child: Center(
          child: Text(
        '$text',
        style: TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
      )),
    );
  }
}
