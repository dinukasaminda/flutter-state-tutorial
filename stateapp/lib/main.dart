import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stateapp/stateless.w1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BehaviorSubject<String> _cubeStream = BehaviorSubject<String>.seeded("-");

  int _counter = 0;

  @override
  void dispose() {
    if (_cubeStream != null) {
      _cubeStream.close();
    }
    super.dispose();
  }

  void _incrementCounter() {
    // setState(() {
    //
    // });
    _counter++;
    _cubeStream.add("$_counter");
  }

  @override
  Widget build(BuildContext context) {
    print("build  home widget");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StateLessWidget1(text: 'w1:$_counter'),
            StreamBuilder(
              stream: _cubeStream,
              builder: (BuildContext context, _) {
                return StateLessWidget1(
                    text: 'in stream build stateless:$_counter');
              },
            ),
            StateLessWidget1(
              text: "$_counter",
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
