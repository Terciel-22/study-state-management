import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:study_state_management/todo-list/todo.model.dart';
import 'package:study_state_management/todo-list/todo.screen.dart';
import 'counter/counter.model.dart';
import 'counter/counter.screen.dart';

GoRouter _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const CounterScreen()),
  GoRoute(path: '/todo', builder: (context, state) => const TodoScreen()),
]);

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CounterModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => TodoModel(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
