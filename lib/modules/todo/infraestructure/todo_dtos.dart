import 'package:auth_with_todo/modules/todo/domain/todo_entity.dart';
import 'package:auth_with_todo/modules/todo/domain/todo_value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// This Data Transfer Object (DTO) is used transform data between infrastructure,
/// and services layers to domain model layer.
class TodoDto {
  TodoDto({
    required id,
    required complete,
    required task,
    note = '',
  })  : _id = id,
        _complete = complete,
        _task = task,
        _note = note;

  final String _id;
  final bool _complete;
  final String _task;
  final String _note;

  /// Convert to a Todo entity
  TodoEntity toDomain() => TodoEntity(
        id: _id,
        complete: _complete,
        task: Task(_task),
        note: Note(_note),
      );

  /// Convert a JSON object to a TodoDto
  // Factory constructor is initializing a final variable using logic that
  // can’t be handled in the initializer list.
  static TodoDto fromJson(Map<String, Object> json) => TodoDto(
        id: json['id'] as String,
        complete: json['complete'] as bool,
        task: json['task'] as String,
        note: json['note'] as String,
      );

  /// Get a JSON object.
  Map<String, Object?> toJson() => {
        'id': _id,
        'complete': _complete,
        'task': _task,
        'note': _note,
      };

  static TodoDto fromSnapshot(QueryDocumentSnapshot snap) {
    final dynamic data = snap.data();

    if (data == null) throw Exception();

    return TodoDto(
      id: data['id'],
      complete: data['complete'],
      task: data['task'],
      note: data['note'],
    );
  }

  Map<String, Object?> toDocument() => {
        'id': _id,
        'complete': _complete,
        'task': _task,
        'note': _note,
      };
}
