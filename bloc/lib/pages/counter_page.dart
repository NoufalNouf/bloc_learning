import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/bloc/auth_bloc.dart';
import '../auth/bloc/auth_event.dart';
import '../auth/bloc/auth_state.dart';
import '../counter/bloc/bloc_counter.dart';
import '../counter/bloc/event_counter.dart';
import '../counter/bloc/state_counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = (context.read<AuthBloc>().state as AuthSuccess).username;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $username'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text('Counter: ${state.count}', style: const TextStyle(fontSize: 32));
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'decrement',
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent());
            },
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'increment',
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent());
            },
          ),
        ],
      ),
    );
  }
}
