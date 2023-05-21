import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
  final List _todos = [];
  List get todos => _todos;

  void addTodos(todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
