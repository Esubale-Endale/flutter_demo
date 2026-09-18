part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class Reset extends CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}
