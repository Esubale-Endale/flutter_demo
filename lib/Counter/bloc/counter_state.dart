part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class CounterLoadedState extends CounterState {
  final int count;
  CounterLoadedState({required this.count });
}
