import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {

  String text;
  Function onPressed;
  Color color;

  BlueButton(this.text,this.onPressed,{this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: color,
      onPressed: onPressed,
    );
  }
}
