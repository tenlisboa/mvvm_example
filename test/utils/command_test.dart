import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example/utils/commands/command.dart';
import 'package:mvvm_example/utils/result/result.dart';

void main() {
  group('.Command0', () {
    group('#execute', () {
      group('when iddle', () {
        test('should have inital state', () {
          final command = Command0<int>(action);

          expect(command.completed, false);
          expect(command.running, false);
          expect(command.error, false);
          expect(command.result, isNull);
        });
      });

      group('when called', () {
        test('should set running to true', () async {
          final command = Command0<int>(action);

          command.execute();

          expect(command.running, true);
        });
      });

      group('when completed', () {
        test('should set completed to true', () async {
          final command = Command0<int>(action);

          await command.execute();

          expect(command.completed, true);
        });

        test('should set running to false', () async {
          final command = Command0<int>(action);

          await command.execute();

          expect(command.running, false);
        });
      });
      group('when succeeded', () {
        test('should set result', () async {
          final command = Command0<int>(action);

          await command.execute();

          expect(command.result, isNotNull);

          expect(command.result, isA<Ok<int>>());
          expect(command.result!.asOk.value, 42);
        });
      });

      group('when error', () {
        test('should set error', () async {
          final command = Command0(() async => Exception("error").error());

          await command.execute();

          expect(command.error, true);
          expect(command.result!.asError.value, isA<Exception>());
        });
      });
    });
  });

  group('.Command1', () {
    group('#execute', () {
      group('when iddle', () {
        test('should have inital state', () {
          final command = Command1<int, int>(action1);

          expect(command.completed, false);
          expect(command.running, false);
          expect(command.error, false);
          expect(command.result, isNull);
        });
      });

      group('when called', () {
        test('should set running to true', () async {
          final command = Command1<int, int>(action1);

          command.execute(42);

          expect(command.running, true);
        });
      });

      group('when completed', () {
        test('should set completed to true', () async {
          final command = Command1<int, int>(action1);

          await command.execute(42);

          expect(command.completed, true);
        });

        test('should set running to false', () async {
          final command = Command1<int, int>(action1);

          await command.execute(42);

          expect(command.running, false);
        });
      });
      group('when succeeded', () {
        test('should set result', () async {
          final command = Command1<int, int>(action1);

          await command.execute(42);

          expect(command.result, isNotNull);

          expect(command.result, isA<Ok<int>>());
          expect(command.result!.asOk.value, 42);
        });
      });

      group('when error', () {
        test('should set error', () async {
          final command =
              Command1<dynamic, int>((p1) async => Exception("error").error());

          await command.execute(42);

          expect(command.error, true);
          expect(command.result!.asError.value, isA<Exception>());
        });
      });
    });
  });
}

Future<Result<int>> action() async => Result.ok(42);

Future<Result<int>> action1(int p1) async => Result.ok(42);
