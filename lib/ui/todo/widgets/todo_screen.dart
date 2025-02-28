import 'package:flutter/material.dart';
import 'package:mvvm_example/ui/todo/view_models/todo_view_model.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key, required this.viewModel});

  final TodoViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo MVVM"),
      ),
      body: ListenableBuilder(
        listenable: viewModel.load,
        builder: (context, child) {
          if (viewModel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.load.error) {
            return Center(child: Text(viewModel.load.error.toString()));
          }
          return child!;
        },
        child: ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) {
              return ListView.builder(
                itemCount: viewModel.todos.length,
                itemBuilder: (context, index) {
                  final todo = viewModel.todos[index];
                  return ListTile(
                    leading: Text(todo.id.toString()),
                    title: Text(todo.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => viewModel.removeTodo.execute(todo),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
