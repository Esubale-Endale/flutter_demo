 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<IncrementButtonPressedEvent>((event, emit) {
      emit(CounterLoadedState(count: (state as CounterLoadedState).count + 1));
    });

    on<DecrementButtonPressedEvent>((event, emit) {
      emit(CounterLoadedState(count: (state as CounterLoadedState).count - 1));
    });
  }
}
