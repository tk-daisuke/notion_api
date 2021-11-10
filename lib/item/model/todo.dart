import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';
// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String title,
    required String tag,
    required DateTime datetime,
  }) = _Todo;

    factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
