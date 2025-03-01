import 'package:flutter/material.dart';
import 'package:mvvm_example/domain/models/todo.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(todo.id.toString()),
      title: Text(todo.title),
      // trailing: IconButton(
      //   icon: const Icon(Icons.delete),
      //   onPressed: () => viewModel.removeTodo.execute(todo),
      // ),
    );
  }
}
