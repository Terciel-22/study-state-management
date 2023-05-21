import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_state_management/widgets/mybottomnavigationbar.dart';
import 'counter.model.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Text(
          'Count: ${context.watch<CounterModel>().counter}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Access the model and call the increment method
          context.read<CounterModel>().increment();
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 0),
    );
  }
}
