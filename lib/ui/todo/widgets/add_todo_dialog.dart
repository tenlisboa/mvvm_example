import 'package:flutter/material.dart';
import 'package:mvvm_example/ui/todo/view_models/todo_view_model.dart';

class AddTodoDialog extends StatefulWidget {
  final TodoViewModel viewModel;
  const AddTodoDialog({
    super.key,
    required this.viewModel,
  });

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    await widget.viewModel.addTodo.execute(_titleController.text);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IntrinsicHeight(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Column(
                children: [
                  Text("Add a new ToDo"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: "Title"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a title";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListenableBuilder(
                    listenable: widget.viewModel.addTodo,
                    builder: (context, child) {
                      return ElevatedButton(
                        onPressed: widget.viewModel.addTodo.running
                            ? null
                            : _submitForm,
                        child: const Text("Add"),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
