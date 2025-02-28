import 'package:flutter/material.dart';
import 'package:mvvm_example/core/result/result.dart';

typedef CommandAction0<T extends Object> = Future<Result<T>> Function();
typedef CommandAction1<T extends Object, P1 extends Object> = Future<Result<T>>
    Function(P1);

abstract class Command<T extends Object> extends ChangeNotifier {
  bool _running = false;

  Result<T>? _result;

  bool get running => _running;

  Result<T>? get result => _result;

  bool get completed => _result is Ok;

  bool get error => _result is Error;

  Future<void> _execute(CommandAction0<T> action) async {
    if (_running) return;

    _running = true;
    _result = null;

    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<T extends Object> extends Command<T> {
  final CommandAction0<T> action;

  Command0(this.action);

  Future<void> execute() => _execute(action);
}

class Command1<T extends Object, P1 extends Object> extends Command<T> {
  final CommandAction1<T, P1> action;

  Command1(this.action);

  Future<void> execute(P1 p1) => _execute(() => action(p1));
}
