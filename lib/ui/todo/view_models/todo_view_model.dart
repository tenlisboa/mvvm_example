import 'package:flutter/material.dart';
import 'package:mvvm_example/utils/commands/command.dart';
import 'package:mvvm_example/utils/result/result.dart';
import 'package:mvvm_example/data/repositories/todos/todos_repository.dart';
import 'package:mvvm_example/domain/models/todo.dart';

class TodoViewModel extends ChangeNotifier {
  late Command0<List<Todo>> load;
  late Command1<Todo, String> addTodo;
  late Command1<void, Todo> removeTodo;

  List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  final TodosRepository _todosRepository;

  TodoViewModel({required TodosRepository todosRepository})
      : _todosRepository = todosRepository {
    load = Command0(_load)..execute();
    addTodo = Command1(_addTodo);
    removeTodo = Command1(_deleteTodo);
  }

  Future<Result<List<Todo>>> _load() async {
    final result = await _todosRepository.fetchTodos();

    switch (result) {
      case Ok<List<Todo>>():
        _todos = result.value;
        notifyListeners();
        break;
      case Error<List<Todo>>():
        // TODO: Logging
        break;
    }

    return result;
  }

  Future<Result<Todo>> _addTodo(String title) async {
    final result = await _todosRepository.addNewTodo(title);

    switch (result) {
      case Ok<Todo>():
        notifyListeners();
        break;
      case Error<Todo>():
        // TODO: Logging
        break;
    }

    return result;
  }

  Future<Result<void>> _deleteTodo(Todo todo) async {
    final result = await _todosRepository.removeTodoById(todo.id);

    switch (result) {
      case Ok<void>():
        _todos.remove(todo);
        notifyListeners();
        break;
      case Error<void>():
        // TODO: Logging
        break;
    }

    return result;
  }
}
