import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/todo_entity.dart';
import 'i_todo_repository.dart';
import '../dto/todo_dtos.dart';

/// Implementation of CRUD commands for Google Firebase database.
///
/// We use DTO to transform Todo entity to be used on Firebase database.
class FirebaseTodoRepository implements ITodoRepository {
  final todoCollection = FirebaseFirestore.instance.collection('todo');

  @override
  Future<void> addNewTodo(TodoEntity todo) => todoCollection
      .doc(todo.id.toString())
      .set(TodoDto.fromEntity(todo).toJson());

  @override
  Future<void> deleteTodo(TodoEntity todo) =>
      todoCollection.doc(todo.id.toString()).delete();

  @override
  Stream<List<TodoEntity>> todos() =>
      todoCollection.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => TodoDto.fromSnapshot(doc).toDomain())
          .toList());

  @override
  Future<void> updateTodo(TodoEntity todo) => todoCollection
      .doc(todo.id.toString())
      .update(TodoDto.fromEntity(todo).toJson());
}
