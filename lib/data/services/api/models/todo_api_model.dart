import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_api_model.g.dart';
part 'todo_api_model.freezed.dart';

@freezed
abstract class TodoApiModel with _$TodoApiModel {
  const factory TodoApiModel.create({
    required String title,
  }) = CreateTodoApiModel;

  factory TodoApiModel.fromJson(Map<String, Object?> json) =>
      _$TodoApiModelFromJson(json);
}
