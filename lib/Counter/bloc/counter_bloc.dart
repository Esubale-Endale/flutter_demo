import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterLoadedState(count: 0)) {
    on<Reset>((event, emit) {
      emit(CounterLoadedState(count: 0));
    });

    on<Increment>((event, emit) {
      final currentCount = (state as CounterLoadedState).count;

      emit(CounterLoadedState(count: currentCount + 1));
    });

    on<Decrement>((event, emit) {
      final currentCount = (state as CounterLoadedState).count;

      emit(CounterLoadedState(count: currentCount - 1));
    });
  }
}
