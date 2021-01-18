import 'package:rxdart/rxdart.dart';

class CubeStateInfinityScroll<T> {
  BehaviorSubject<List<T>> _cubeStream;
  int _totalItems = 0;

  int get getTotalItems => _totalItems;
  int get getItemsCount => _cubeStream.value.length;
  void setTotalItems(int __items) {
    _totalItems = __items;
  }

  CubeStateInfinityScroll(List<T> v) {
    this._cubeStream = BehaviorSubject<List<T>>.seeded(v);
  }

  Stream<List<T>> get cubeStream$ {
    return _cubeStream.stream;
  }

  Stream<List<T>> get cubeStreamNotNull$ {
    return _cubeStream.stream.where((v) => v != null);
  }

  void setNext(List<T> data, int total) {
    _totalItems = total;
    _cubeStream.add(data);
  }

  void addMore(List<T> data) {
    var oldData = _cubeStream.value;
    oldData.addAll(data);
    _cubeStream.add(oldData);
  }

  void clearItems() {
    var oldData = _cubeStream.value;
    oldData.clear();
    _cubeStream.add(oldData);
  }

  List<T> get value => _cubeStream.value;
}
