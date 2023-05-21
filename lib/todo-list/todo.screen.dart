import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_state_management/todo-list/todo.model.dart';
import 'package:study_state_management/widgets/mybottomnavigationbar.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController todo = TextEditingController();
  final todoModel = TodoModel();

  @override
  Widget build(BuildContext context) {
    final todoList = context.watch<TodoModel>().todos;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Todo List"),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: todo,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<TodoModel>().addTodos(todo.text);
                      },
                      child: const Text("Add"))
                ],
              ),
            ),
            const Divider(color: Colors.black),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todoList[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<TodoModel>().removeTodo(todo.text);
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 1),
    );
  }
}
