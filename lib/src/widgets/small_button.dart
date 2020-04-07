import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final text;

  SmallButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      width: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.blue)),
      child: Center(
        child: Text(
          '$text',
          style: TextStyle(color: Colors.blue, fontSize: 16.0),
        ),
      ),
    );
  }
}
