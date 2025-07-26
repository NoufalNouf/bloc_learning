import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/bloc/auth_bloc.dart';
import '../auth/bloc/auth_event.dart';

class LoginPage extends StatelessWidget {
  final  TextEditingController _controller = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter BLoC Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final username = _controller;
                context.read<AuthBloc>().add(LoginEvent(username as String));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
