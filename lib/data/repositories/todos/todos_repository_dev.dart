import 'package:mvvm_example/core/result/result.dart';
import 'package:mvvm_example/data/repositories/todos/todos_repository.dart';
import 'package:mvvm_example/domain/models/todo.dart';

class TodosRepositoryDev implements TodosRepository {
  final List<Todo> _todos = [];

  @override
  Future<Result<Todo>> addNewTodo(String title) async {
    final todo = Todo(
      id: _todos.length + 1,
      title: title,
    );

    _todos.add(todo);

    return Result.ok(todo);
  }

  @override
  Future<Result<List<Todo>>> fetchTodos() async {
    return Result.ok(_todos);
  }

  @override
  Future<Result<void>> removeTodoById(int id) async {
    final todo = _todos.firstWhere((element) => element.id == id);

    _todos.remove(todo);

    return Result.ok(null);
  }
}
