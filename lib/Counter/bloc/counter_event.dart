part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class IncrementButtonPressedEvent extends CounterEvent {}

class DecrementButtonPressedEvent extends CounterEvent {}
