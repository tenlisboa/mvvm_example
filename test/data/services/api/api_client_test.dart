import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example/data/services/api/api_client.dart';
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
        final result = await apiClient.createTodo('Test');

        expect(result.asOk.value, isA<Todo>());
      });
    });
  });
}
