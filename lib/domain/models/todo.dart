class Todo {
  final int id;
  final String title;

  Todo({
    required this.id,
    required this.title,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: int.parse(json['id']),
      title: json['title'],
    );
  }
}
