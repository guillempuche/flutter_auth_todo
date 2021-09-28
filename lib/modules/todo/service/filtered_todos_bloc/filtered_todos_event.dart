part of 'filtered_todos_bloc.dart';

abstract class FilteredTodosEvent extends Equatable {}

class FilteredTodosFilterUpdated extends FilteredTodosEvent {
  FilteredTodosFilterUpdated(this.filterUpdated);

  final VisibilityFilter filterUpdated;

  @override
  List<Object> get props => [filterUpdated];

  @override
  String toString() =>
      'FilteredTodosFilterUpdated { filterUpdated: $filterUpdated }';
}

class FilteredTodosSomeUpdated extends FilteredTodosEvent {
  FilteredTodosSomeUpdated(this.someUpdated);

  final List<TodoEntity> someUpdated;

  @override
  List<Object> get props => [someUpdated];

  @override
  String toString() => 'FilteredTodosSomeUpdated { someUpdated: $someUpdated }';
}
