import 'package:rxdart/rxdart.dart';

class CubeReplayState<T> {
  ReplaySubject<T> _cubeStream;

  final maxSize;
  CubeReplayState({this.maxSize = 10}) {
    this._cubeStream = ReplaySubject<T>(maxSize: this.maxSize);
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

  Future<T> get value => _cubeStream.last;
}
