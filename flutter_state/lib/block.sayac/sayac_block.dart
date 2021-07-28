import 'dart:async';
import 'package:flutter_state/block.sayac/sayac_event.dart';

class SayacBlock {
  int _sayac = 0;
  //state için streamcontroller
  final _sayacStateStreamController = StreamController<int>();
  Stream<int> get sayac => _sayacStateStreamController.stream;
  StreamSink<int> get sayacStateSink => _sayacStateStreamController.sink;

  //eventler için sstreamcontroller
  final _sayacEventStreamController = StreamController<SayacEvent>();
  Stream<SayacEvent> get _sayacEventStream =>
      _sayacEventStreamController.stream;
  StreamSink<SayacEvent> get sayacEventSink => _sayacEventStreamController.sink;

  SayacBlock() {
    _sayacEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(SayacEvent event) {
    if (event is ArttirmaEvent) {
      _sayac++;
    } else {
      _sayac--;
    }
    sayacStateSink.add(_sayac);
  }
}
