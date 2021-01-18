import 'package:rxdart/rxdart.dart';
import 'package:stateapp/state/states/vehicle_list_state.dart';

import 'base/cube_state.dart';

class AppState {
  BehaviorSubject<String> cubeStream;
  var state2 = CubeState<int>(0);

  var vehicleState = VehicleListState();
  AppState() {
    print("App state init");
    cubeStream = BehaviorSubject<String>.seeded("-");
  }
}
