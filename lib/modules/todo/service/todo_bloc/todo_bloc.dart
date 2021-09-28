import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/todo_entity.dart';
import '../../infraestructure/i_todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({
    required ITodoRepository todoRepository,
  })  : _todoRepository = todoRepository,
        super(TodoLoadInProgress()) {
    on<TodoLoaded>(_onTodoLoaded);
    on<TodoAdded>(_onTodoAdded);
    on<TodoUpdated>(_onTodoUpdated);
    on<TodoSomeUpdated>(_onTodoSomeUpdated);
    on<TodoDeleted>(_onTodoDeleted);
    on<TodoClearCompleted>(_onTodoClearCompleted);
    on<TodoAllToggled>(_onTodoAllToggled);
  }

  final ITodoRepository _todoRepository;

  Future<void> _onTodoLoaded(
    TodoLoaded event,
    Emitter<TodoState> emit,
  ) =>
      emit.onEach<List<TodoEntity>>(
        _todoRepository.todos(),
        onData: (todos) => add(TodoSomeUpdated(todos)),
      );

  void _onTodoAdded(TodoAdded event, _) {
    _todoRepository.deleteTodo(event.addedTodo);
  }

  void _onTodoUpdated(TodoUpdated event, _) {
    _todoRepository.updateTodo(event.updatedTodo);
  }

  void _onTodoSomeUpdated(
    TodoSomeUpdated event,
    Emitter<TodoState> emit,
  ) {
    emit(TodoLoadSuccess(event.updatedTodos));
  }

  void _onTodoDeleted(TodoDeleted event, _) {
    _todoRepository.deleteTodo(event.deletedTodo);
  }

  void _onTodoClearCompleted(TodoClearCompleted event, _) {
    final currentState = state;

    if (currentState is TodoLoadSuccess) {
      final List<TodoEntity> completedTodos =
          currentState.todos.where((todo) => todo.complete).toList();

      completedTodos.forEach((completedTodo) {
        _todoRepository.deleteTodo(completedTodo);
      });
    }
  }

  void _onTodoAllToggled(TodoAllToggled event, _) {
    final currentState = state;

    if (currentState is TodoLoadSuccess) {
      final allComplete = currentState.todos.every((todo) => todo.complete);

      final List<TodoEntity> updatedTodos = currentState.todos
          .map((todo) => todo.copyWith(complete: !allComplete))
          .toList();

      updatedTodos.forEach((updatedTodo) {
        _todoRepository.updateTodo(updatedTodo);
      });
    }
  }
}
