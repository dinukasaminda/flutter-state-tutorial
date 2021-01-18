import 'package:rxdart/rxdart.dart';

class CubeState<T> {
  BehaviorSubject<T> _cubeStream;

  CubeState(T v) {
    this._cubeStream = BehaviorSubject<T>.seeded(v);
  }

  Stream<T> get cubeStream$ {
    return _cubeStream.stream;
  }

  Stream<T> get cubeStreamNotNull$ {
    return _cubeStream.stream.where((v) => v != null);
  }

  void setNext(T data) {
    _cubeStream.add(data);
  }

  T get value => _cubeStream.value;
}
