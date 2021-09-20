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

  // factory TodoEntity({
  //   required id,
  //   required complete,
  //   required task,
  //   note,
  // }) =>
  //     TodoEntity._(id: id, complete: complete, task: task, note: note);

  final String id;
  final bool complete;
  final Task task;
  final Note note;

  @override
  List<Object> get props => [id, complete, task, note];

  @override
  String toString() =>
      'TodoEntity { id: $id, complete: $complete, task: $task, note: $note }';
}
