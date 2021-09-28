import 'package:equatable/equatable.dart';

import '/modules/shared/unique_entity_id.dart';
import 'todo_value_objects.dart';

/// It creates the to-do task entity for the Todo bounded-context. This is an
/// aggregate root.
///
/// The entity uses [Equatable] as an entity base class to compare different
/// instances of Todo by value. It inherites ([props], [toString], [hashcode]
/// and [operator ==]).
class TodoEntity extends Equatable {
  const TodoEntity({
    required id,
    required complete,
    required task,
    required note,
  })  : _id = id,
        _complete = complete,
        _task = task,
        _note = note;

  final UniqueId _id;
  final bool _complete;
  final Task _task;
  final Note _note;

  UniqueId get id => _id;
  bool get complete => _complete;
  Task get task => _task;
  Note get note => _note;

  @override
  List<Object> get props => [_id, _complete, _task, _note];

  @override
  String toString() =>
      'TodoEntity { id: $_id, complete: $_complete, task: $_task, note: $_note }';

  TodoEntity copyWith({
    bool? complete,
    Task? task,
    Note? note,
  }) =>
      TodoEntity(
          id: _id,
          complete: complete ?? _complete,
          task: task ?? _task,
          note: note ?? _note);
}
