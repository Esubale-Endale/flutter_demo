import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/Counter/bloc/counter_bloc.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterPage(),
      ),
    );
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$count', style: Theme.of(context).textTheme.displayLarge),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(Decrement());
                      },
                      child: const Text('-'),
                    ),

                    const SizedBox(width: 20),

                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(Increment());
                      },
                      child: const Text('+'),
                    ),

                    const SizedBox(width: 20),

                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(Reset());
                      },
                      child: const Text('0'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
