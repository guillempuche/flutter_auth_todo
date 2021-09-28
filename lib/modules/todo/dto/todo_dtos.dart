import 'package:cloud_firestore/cloud_firestore.dart';

import '/modules/shared/unique_entity_id.dart';
import '../domain/todo_entity.dart';
import '../domain/todo_value_objects.dart';

/// This Data Transfer Object (DTO) is used transform data between infrastructure,
/// and services layers to Todo domain model layer.
class TodoDto {
  const TodoDto({
    required String id,
    required bool complete,
    required String task,
    String note = '',
  })  : _id = id,
        _complete = complete,
        _task = task,
        _note = note;

  final String _id;
  final bool _complete;
  final String _task;
  final String _note;

  static TodoDto fromEntity(TodoEntity todoEntity) => TodoDto(
        id: todoEntity.id.toString(),
        complete: todoEntity.complete,
        task: todoEntity.task.toString(),
        note: todoEntity.note.toString(),
      );

  /// Convert to a Todo entity
  TodoEntity toDomain() => TodoEntity(
        id: UniqueId(_id),
        complete: _complete,
        task: Task(_task),
        note: Note(_note),
      );

  /// Convert a JSON object to a TodoDto
  static TodoDto fromJson(Map<String, Object> json) => TodoDto(
        id: json['id'] as String,
        complete: json['complete'] as bool,
        task: json['task'] as String,
        note: json['note'] as String,
      );

  /// Convert to a JSON object.
  Map<String, Object?> toJson() => {
        'id': _id,
        'complete': _complete,
        'task': _task,
        'note': _note,
      };

  /// Convert from snapshot of Firestore to DTO.
  static TodoDto fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snap) {
    final Map<String, dynamic> data = snap.data();

    // if (data == null) throw Exception('Data=$data is null');

    return TodoDto(
      id: data['id'],
      complete: data['complete'],
      task: data['task'],
      note: data['note'],
    );
  }
}
