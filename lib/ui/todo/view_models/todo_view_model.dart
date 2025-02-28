import 'package:flutter/material.dart';
import 'package:mvvm_example/core/commands/command.dart';
import 'package:mvvm_example/core/result/result.dart';
import 'package:mvvm_example/domain/models/todo.dart';

class TodoViewModel extends ChangeNotifier {
  late Command0 load;
  late Command1<Todo, String> addTodo;
  late Command1<void, Todo> removeTodo;

  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  TodoViewModel() {
    load = Command0(_load)..execute();
    addTodo = Command1(_addTodo);
    removeTodo = Command1(_deleteTodo);
  }

  Future<Result> _load() async {
    await Future.delayed(Duration(seconds: 1));

    notifyListeners();

    return Result.ok(_todos);
  }

  Future<Result<Todo>> _addTodo(String title) async {
    await Future.delayed(Duration(seconds: 1));

    final todo = Todo(
      id: _todos.length + 1,
      title: title,
    );
    _todos.add(todo);

    notifyListeners();

    return Result.ok(todo);
  }

  Future<Result> _deleteTodo(Todo todo) async {
    await Future.delayed(Duration(seconds: 1));

    _todos.remove(todo);

    notifyListeners();

    return Result.ok(_todos);
  }
}
