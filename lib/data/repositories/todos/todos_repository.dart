import 'package:mvvm_example/utils/result/result.dart';
import 'package:mvvm_example/domain/models/todo.dart';

abstract class TodosRepository {
  Future<Result<List<Todo>>> fetchTodos();
  Future<Result<Todo>> addNewTodo(String title);
  Future<Result<void>> removeTodoById(int id);
}
