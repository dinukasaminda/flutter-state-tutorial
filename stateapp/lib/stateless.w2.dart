import 'package:flutter/material.dart';
import 'package:stateapp/main.dart';
import 'package:stateapp/state/app_state.dart';
import 'package:rxdart/rxdart.dart';

class StateLessWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = getIt.get<AppState>();
    print("build w2 widget");
    return Container(
      child: Column(
        children: [
          StreamBuilder(
            stream:
                appState.state2.cubeStream$.debounceTime(Duration(seconds: 1)),
            builder: (BuildContext context, _) {
              print("build 2");
              var x = appState.state2.value;
              return Text('in stream build stateless2:$x');
            },
          ),
          TextField(
            onChanged: (v) {
              appState.vehicleState.searchText.setNext(v);
            },
          )
        ],
      ),
    );
  }
}
