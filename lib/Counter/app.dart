import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/Counter/bloc/counter_bloc.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CounterPage();
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  void blocListener(BuildContext context, CounterState state) {
    if (state is CounterLoadedState) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Count: ${state.count}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      listener: blocListener,
      builder: (context, state) {
        final count = state is CounterLoadedState ? state.count : 0;

        return Scaffold(
          appBar: AppBar(title: const Text('Counter')),
          body: Center(
            child: Text(
              '$count',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        );
      },
    );
  }
}
