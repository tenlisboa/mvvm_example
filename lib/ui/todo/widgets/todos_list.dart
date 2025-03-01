import 'package:flutter/material.dart';
import 'package:mvvm_example/domain/models/todo.dart';
import 'package:mvvm_example/ui/todo/view_models/todo_view_model.dart';
import 'package:mvvm_example/ui/todo/widgets/todo_tile.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todos;

  final TodoViewModel viewModel;

  const TodosList({super.key, required this.todos, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(child: Text('No todos'));
    }
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoTile(todo: todo, viewModel: viewModel);
      },
    );
  }
}
