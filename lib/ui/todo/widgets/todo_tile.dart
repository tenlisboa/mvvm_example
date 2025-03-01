import 'package:flutter/material.dart';
import 'package:mvvm_example/domain/models/todo.dart';
import 'package:mvvm_example/ui/todo/view_models/todo_view_model.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
    required this.viewModel,
  });

  final Todo todo;

  final TodoViewModel viewModel;

  void _onDeleteTodo() async {
    await viewModel.removeTodo.execute(todo);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(todo.id.toString()),
      title: Text(todo.title),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: _onDeleteTodo,
      ),
    );
  }
}
