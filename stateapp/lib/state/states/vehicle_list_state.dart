import 'package:stateapp/state/base/cube_state.dart';

class VehicleListState {
  var vehicleSearchList = CubeState<List<int>>([]);
  var searchText = CubeState<String>("");
  getList() async {
    try {
      //http call
      //x = response
      // vehicleSearchList.setNext(x)
      // setting data
    } catch (err) {
      throw err;
    }
  }
}
