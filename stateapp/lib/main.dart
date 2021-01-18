import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stateapp/state/app_state.dart';
import 'package:stateapp/statefull.w1.dart';
import 'package:stateapp/stateless.w1.dart';
import 'package:stateapp/stateless.w2.dart';
import 'package:rxdart/rxdart.dart';

GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<AppState>(AppState());

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
  AppState appState = getIt.get<AppState>();

  int _counter = 0;
  void _incrementCounter() {
    _counter++;
    appState.cubeStream.add("$_counter");
  }

  var isLoading = false;
  void _incrementCounter2() async {
    appState.state2.setNext(appState.state2.value + 1);

    // setState(() {
    //   isLoading = true;
    // });
    // try {
    //   await appState.vehicleState.getList();
    // } catch (err) {
    //   // snack bar ...
    // }
    // setState(() {
    //   isLoading = false;
    // });
  }

  StreamSubscription sub;
  @override
  void initState() {
    sub = this
        .appState
        .vehicleState
        .searchText
        .cubeStream$
        .debounceTime(Duration(milliseconds: 800))
        .listen((event) {
      print("Search Keyword:$event");
      this.appState.vehicleState.searchVehicles();
    });

    super.initState();
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build  home widget");
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: appState.vehicleState.searchText.cubeStream$
              .debounceTime(Duration(milliseconds: 600)),
          builder: (BuildContext context, _) {
            return Text(appState.vehicleState.searchText.value);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StateLessWidget1(),
            StateLessWidget2(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 50),
          FloatingActionButton(
            onPressed: _incrementCounter2,
            tooltip: 'Increment2',
            child: Icon(Icons.card_travel),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
