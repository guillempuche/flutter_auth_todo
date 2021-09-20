import 'package:auth_with_todo/modules/todo/domain/todo_entity.dart';
import 'package:auth_with_todo/modules/todo/domain/todo_value_objects.dart';

/// This Data Transfer Object (DTO) is used transform data between infrastructure,
/// and services layers to domain model layer.
class TodoDto {
  TodoDto({
    required this.id,
    required this.complete,
    required this.task,
    this.note = '',
  });

  final String id;
  final bool complete;
  final String task;
  final String note;

  /// Convert to a Todo entity
  TodoEntity toDomain() => TodoEntity(
        id: id,
        complete: complete,
        task: Task(task),
        note: Note(note),
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
        'id': id,
        'complete': complete,
        'task': task,
        'note': note,
      };

  static TodoEntity fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data();

    return TodoEntity(
      id: data['id'],
      task: data['task'],
      complete: data['complete'],
      note: data['note'],
    );
  }
}
