import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example/data/services/api/api_client.dart';
import 'package:mvvm_example/data/services/api/models/todo_api_model.dart';
import 'package:mvvm_example/domain/models/todo.dart';
import 'package:mvvm_example/utils/result/result.dart';

void main() {
  late ApiClient apiClient;

  setUp(() {
    apiClient = ApiClient();
  });

  group('.ApiClient', () {
    group('#fetchTodos', () {
      group('when called', () {
        test('should return todo list', () async {
          final result = await apiClient.fetchTodos();

          expect(result.asOk.value, isA<List<Todo>>());
        });
      });
    });

    group('#createTodo', () {
      test('should return a todo', () async {
        final result =
            await apiClient.createTodo(CreateTodoApiModel(title: 'test'));

        expect(result.asOk.value, isA<Todo>());
      });
    });

    group('#deleteTodoById', () {
      test('should return null', () async {
        final createResult =
            await apiClient.createTodo(CreateTodoApiModel(title: 'test'));

        final deleteResult =
            await apiClient.deleteTodoById(createResult.asOk.value.id);

        final fetchResult = await apiClient.fetchTodos();

        expect(fetchResult.asOk.value, isA<List<Todo>>());
        expect(
            fetchResult.asOk.value
                .where((todo) => todo.id == createResult.asOk.value.id),
            isEmpty);
        expect(deleteResult, isA<Result<void>>());
      });
    });
  });
}
