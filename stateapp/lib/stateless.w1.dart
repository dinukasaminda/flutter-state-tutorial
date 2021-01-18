import 'package:flutter/material.dart';

class StateLessWidget1 extends StatelessWidget{
  final String text;

  const StateLessWidget1({Key key, this.text}) : super(key: key);
@override
  Widget build(BuildContext context) {
    print("build w1 widget");
    return Container(child:Text(text),);  }
}