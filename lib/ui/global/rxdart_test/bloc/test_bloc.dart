import 'package:rxdart/rxdart.dart';

class TestBloc {
  int _count = 0;
  bool isIncrement = true;
  BehaviorSubject<int> subjectCounter;

  TestBloc() {
    subjectCounter = BehaviorSubject<int>.seeded(this._count);
  }

  Stream<int> get counter => subjectCounter.stream;

  void increment() {
    _count++;
    subjectCounter.sink.add(_count);
  }

  void decrement() {
    _count--;
    subjectCounter.sink.add(_count);
  }

  void dispose() {
    subjectCounter.close();
  }
}
