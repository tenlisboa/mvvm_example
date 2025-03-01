import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example/utils/result/result.dart';

void main() {
  group('.Result', () {
    group('#ok', () {
      group('when called', () {
        test('should return an instance of Ok', () {
          final result = Result.ok(42);

          assert(result is Ok<int>);
        });

        test('should return an instance of Ok with the given value', () {
          final result = Result.ok(42);

          expect(result.asOk.value, 42);
        });
      });
    });
    group('#error', () {
      group('when called', () {
        test('should return an instance of Error', () {
          final result = Result.error(42);

          assert(result is Error<int>);
        });

        test('should return an instance of Error with the given value', () {
          final result = Result.error(42);

          expect(result.asError.value, 42);
        });
      });
    });
  });
}
