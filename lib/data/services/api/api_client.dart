import 'dart:convert';
import 'dart:io';

import 'package:mvvm_example/domain/models/todo.dart';
import 'package:mvvm_example/utils/result/result.dart';

class ApiClient {
  final String _host;
  final int _port;
  final HttpClient Function() _clientHttpFactory;

  ApiClient({
    String? host,
    int? port,
    HttpClient Function()? clientHttpFactory,
  })  : _host = host ?? "localhost",
        _port = port ?? 3000,
        _clientHttpFactory = clientHttpFactory ?? HttpClient.new;

  Future<Result<List<Todo>>> fetchTodos() async {
    final client = _clientHttpFactory();

    try {
      final request = await client.get(_host, _port, "/todos");

      final response = await request.close();

      if (response.statusCode == 200) {
        final body = await response.transform<String>(Utf8Decoder()).join();
        final List<dynamic> json = jsonDecode(body);
        final List<Todo> todos = json.map((e) => Todo.fromJson(e)).toList();
        return Result.ok(todos);
      } else {
        return Result.error(Exception("Failed to fetch todos"));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }
}
