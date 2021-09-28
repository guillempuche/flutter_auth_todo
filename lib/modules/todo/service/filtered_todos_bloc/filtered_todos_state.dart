part of 'filtered_todos_bloc.dart';

abstract class FilteredTodosState extends Equatable {}

class FilteredTodosLoadInProgress extends FilteredTodosState {
  FilteredTodosLoadInProgress();

  @override
  List<Object> get props => [];
}

class FilteredTodosLoadSuccess extends FilteredTodosState {
  FilteredTodosLoadSuccess(this.filteredTodos, this.activeFilter);

  final List<TodoEntity> filteredTodos;
  final VisibilityFilter activeFilter;

  @override
  List<Object> get props => [filteredTodos, activeFilter];

  @override
  String toString() =>
      'FilteredTodosLoadSuccess { filteredTodos: $filteredTodos, activeFilter: $activeFilter }';
}
