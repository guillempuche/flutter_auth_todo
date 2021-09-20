import 'package:cloud_firestore/cloud_firestore.dart';

import 'todo_dtos.dart';

/// It's the base class to do CRUD commands. Then you implement this base class
/// to use any database (Firebase, DynamoDB, etc).
abstract class TodoRepository {
  Future<void> addNewTodo(TodoDto todo);

  Future<void> deleteTodo(TodoDto todo);

  Stream<List<TodoDto>> todos();

  Future<void> updateTodo(TodoDto todo);
}

/// Implementation of CRUD on Google Firebase database.
class FirebaseTodoRepository implements TodoRepository {
  final todoCollection = FirebaseFirestore.instance.collection('todo');

  @override
  Future<void> addNewTodo(TodoDto todo) =>
      todoCollection.doc(todo.toDomain().id).set((todo.toDocument()));

  @override
  Future<void> deleteTodo(TodoDto todo) =>
      todoCollection.doc(todo.toDomain().id).delete();

  @override
  Stream<List<TodoDto>> todos() => todoCollection.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => TodoDto.fromSnapshot(doc)).toList());

  @override
  Future<void> updateTodo(TodoDto todo) =>
      todoCollection.doc(todo.toDomain().id).update(todo.toDocument());
}
