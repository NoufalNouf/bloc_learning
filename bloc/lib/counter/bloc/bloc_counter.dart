import 'package:bloc_app/counter/bloc/state_counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_counter.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)){
    on<IncrementEvent>((event,emit){
      emit(CounterState(state.count+1));
    });

    on<DecrementEvent>((event,emit){
      emit(CounterState(state.count-1));
    });
  }
}