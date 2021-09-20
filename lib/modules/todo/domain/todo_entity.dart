import 'package:equatable/equatable.dart';

import 'todo_value_objects.dart';

/// It creates the to-do tasks entity for the Todo bounded-context.
///
/// The entity uses [Equatable] as an entity base class to compare objects. It
/// inherites ([props], [toString], [hashcode] and [operator ==]).
class TodoEntity extends Equatable {
  const TodoEntity({
    required this.id,
    required this.complete,
    required this.task,
    required this.note,
  });

  final String id;
  final bool complete;
  final Task task;
  final Note note;

  @override
  List<Object> get props => [id, complete, task, note];

  @override
  String toString() =>
      'TodoEntity { id: $id, complete: $complete, task: $task, note: $note }';

  TodoEntity copyWith({
    bool? complete,
    Task? task,
    Note? note,
  }) =>
      TodoEntity(
          id: id,
          complete: complete ?? this.complete,
          task: task ?? this.task,
          note: note ?? this.note);
}
