import '../domain/todo_entity.dart';

/// The interface is the base class to do CRUD commands. Then you implement this base class
/// to use any database (Firebase, DynamoDB, etc).
abstract class ITodoRepository {
  Future<void> addNewTodo(TodoEntity todo);

  Future<void> deleteTodo(TodoEntity todo);

  Stream<List<TodoEntity>> todos();

  Future<void> updateTodo(TodoEntity todo);
}
