import 'package:flutter/material.dart';
import 'package:mvvm_example/ui/todo/view_models/todo_view_model.dart';
import 'package:mvvm_example/ui/todo/widgets/add_todo_dialog.dart';
import 'package:mvvm_example/ui/todo/widgets/todos_list.dart';

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
            return TodosList(
              todos: viewModel.todos,
              viewModel: viewModel,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTodoDialog(
                viewModel: viewModel,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
