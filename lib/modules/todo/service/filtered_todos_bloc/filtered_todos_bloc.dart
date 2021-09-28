import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/modules/todo/domain/todo_entity.dart';
import '/modules/todo/service/todo_bloc/todo_bloc.dart';
import '/presentation/models/models.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  FilteredTodosBloc({
    required TodoBloc todosBloc,
  })  : _todosBloc = todosBloc,
        super(
          todosBloc.state is TodoLoadSuccess
              ? FilteredTodosLoadSuccess(
                  (todosBloc.state as TodoLoadSuccess).todos,
                  VisibilityFilter.all,
                )
              : FilteredTodosLoadInProgress(),
        ) {
    on<FilteredTodosFilterUpdated>(_onFilteredTodosFilterUpdated);
    on<FilteredTodosSomeUpdated>(_onFilteredTodosSomeUpdated);

    _todosSubscription = todosBloc.stream.listen(
      (state) {
        if (state is TodoLoadSuccess) {
          add(FilteredTodosSomeUpdated(state.todos));
        }
      },
    );
  }

  final TodoBloc _todosBloc;
  late StreamSubscription<TodoState> _todosSubscription;

  void _onFilteredTodosFilterUpdated(
    FilteredTodosFilterUpdated event,
    Emitter<FilteredTodosState> emit,
  ) {
    final state = _todosBloc.state;

    if (state is TodoLoadSuccess) {
      emit(FilteredTodosLoadSuccess(
          _mapTodoToFilteredTodos(
            state.todos,
            event.filterUpdated,
          ),
          event.filterUpdated));
    }
  }

  void _onFilteredTodosSomeUpdated(
    FilteredTodosSomeUpdated event,
    Emitter<FilteredTodosState> emit,
  ) {
    final state = this.state;
    final visibilityFilter = state is FilteredTodosLoadSuccess
        ? state.activeFilter
        : VisibilityFilter.all;

    emit(FilteredTodosLoadSuccess(
      _mapTodoToFilteredTodos(
        (_todosBloc.state as TodoLoadSuccess).todos,
        visibilityFilter,
      ),
      visibilityFilter,
    ));
  }

  List<TodoEntity> _mapTodoToFilteredTodos(
    List<TodoEntity> todos,
    VisibilityFilter filter,
  ) {
    return todos.where((todo) {
      if (filter == VisibilityFilter.all) {
        return true;
      } else if (filter == VisibilityFilter.active) {
        return todo.complete == false;
      } else {
        // The last option is when the filter is VisibilityFilter.completed
        return todo.complete;
      }
    }).toList();
  }

  @override
  Future<void> close() {
    _todosSubscription.cancel();

    return super.close();
  }
}
