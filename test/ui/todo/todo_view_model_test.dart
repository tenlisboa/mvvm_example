import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example/ui/todo/view_models/todo_view_model.dart';

void main() {
  group('.TodoViewModel', () {
    group('#addTodo', () {
      test('should add todo', () async {
        final viewModel = TodoViewModel();

        expect(viewModel.todos, isEmpty);

        await viewModel.addTodo.execute('Buy milk');

        expect(viewModel.todos, isNotEmpty);
      });
    });
    group('#load', () {
      test('should load todos', () async {
        final viewModel = TodoViewModel();

        expect(viewModel.todos, isEmpty);

        await viewModel.addTodo.execute('Buy milk');
        await viewModel.load.execute();

        expect(viewModel.todos, isNotEmpty);
      });
    });
  });
}
