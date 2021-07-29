import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is CounterArttir) {
      yield CounterState(state.sayac + 1);
    }
    if (event is CounterAzalt) {
      yield CounterState(state.sayac - 1);
      //eğer o an sayaç değeri 4 ise ekrana CounterState(3) döndürür.
    }
  }
}
