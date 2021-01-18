import 'package:flutter/material.dart';

class StateFullWidget1 extends StatefulWidget {
  final String text;

  const StateFullWidget1({Key key, this.text}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<StateFullWidget1> {
  @override
  void initState() {
    print("widget  init");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build statefull w1 widget");
    return Container(child: buildText(widget.text));
  }

  Widget buildText(String text) {
    return Text(text);
  }
}
