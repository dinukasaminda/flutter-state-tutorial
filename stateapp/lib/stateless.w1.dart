import 'package:flutter/material.dart';
import 'package:stateapp/main.dart';
import 'package:stateapp/state/app_state.dart';

class StateLessWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = getIt.get<AppState>();
    print("build w1 widget");
    return Container(
      child: StreamBuilder(
        stream: appState.cubeStream,
        builder: (BuildContext context, _) {
          print("build 1");
          var x = appState.cubeStream.value;
          return Text('in stream build stateless:$x');
        },
      ),
    );
  }
}
