part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodoEvent {}

class TodoAdded extends TodoEvent {
  const TodoAdded(this.addedTodo);

  final TodoEntity addedTodo;

  @override
  List<Object> get props => [addedTodo];

  @override
  String toString() => "TodoAdded { addedTodo: $addedTodo }";
}

class TodoUpdated extends TodoEvent {
  const TodoUpdated(this.updatedTodo);

  final TodoEntity updatedTodo;

  @override
  List<Object> get props => [updatedTodo];

  @override
  String toString() => "TodoUpdated { updatedTodo: $updatedTodo }";
}

class TodoSomeUpdated extends TodoEvent {
  const TodoSomeUpdated(this.updatedTodos);

  final List<TodoEntity> updatedTodos;

  @override
  List<Object> get props => [updatedTodos];

  @override
  String toString() => "TodoSomeUpdated { updatedTodos: $updatedTodos }";
}

class TodoDeleted extends TodoEvent {
  const TodoDeleted(this.deletedTodo);

  final TodoEntity deletedTodo;

  @override
  List<Object> get props => [deletedTodo];

  @override
  String toString() => "TodoDeleted { deletedTodo: $deletedTodo }";
}

class TodoClearCompleted extends TodoEvent {}

class TodoAllToggled extends TodoEvent {}
