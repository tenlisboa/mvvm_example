import 'package:mvvm_example/data/services/api/api_client.dart';
import 'package:mvvm_example/data/services/api/models/todo_api_model.dart';
import 'package:mvvm_example/utils/result/result.dart';
import 'package:mvvm_example/data/repositories/todos/todos_repository.dart';
import 'package:mvvm_example/domain/models/todo.dart';

class TodosRepositoryRemote implements TodosRepository {
  final ApiClient _apiClient;

  const TodosRepositoryRemote({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<Result<Todo>> addNewTodo(String title) async {
    try {
      final result = await _apiClient.createTodo(
        CreateTodoApiModel(title: title),
      );

      switch (result) {
        case Ok<Todo>():
          return Result.ok(result.value);
        default:
          return result;
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<Todo>>> fetchTodos() async {
    try {
      final result = await _apiClient.fetchTodos();

      switch (result) {
        case Ok<List<Todo>>():
          return Result.ok(result.value);
        default:
          return result;
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> removeTodoById(String id) async {
    try {
      final result = await _apiClient.deleteTodoById(id);

      switch (result) {
        case Ok<void>():
          return Result.ok(result.value);
        default:
          return result;
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
