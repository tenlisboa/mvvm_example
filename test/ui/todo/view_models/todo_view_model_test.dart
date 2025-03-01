import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example/data/repositories/todos/todos_repository.dart';
import 'package:mvvm_example/data/repositories/todos/todos_repository_dev.dart';
import 'package:mvvm_example/ui/todo/view_models/todo_view_model.dart';

void main() {
  late TodoViewModel viewModel;
  late TodosRepository todosRepository;

  setUp(() {
    todosRepository = TodosRepositoryDev();
    viewModel = TodoViewModel(todosRepository: todosRepository);
  });

  group('.TodoViewModel', () {
    group('#addTodo', () {
      test('should add todo', () async {
        expect(viewModel.todos, isEmpty);

        await viewModel.addTodo.execute('Buy milk');

        expect(viewModel.todos, isNotEmpty);
      });
    });
    group('#load', () {
      test('should load todos', () async {
        expect(viewModel.todos, isEmpty);

        await viewModel.addTodo.execute('Buy milk');
        await viewModel.load.execute();

        expect(viewModel.todos, isNotEmpty);
      });
    });

    group('#removeTodo', () {
      test('should delete todo', () async {
        await viewModel.addTodo.execute('Buy milk');
        await viewModel.addTodo.execute('Buy bread');

        expect(viewModel.todos, hasLength(2));

        await viewModel.removeTodo.execute(viewModel.todos.first);

        expect(viewModel.todos, hasLength(1));
      });
    });
  });
}
