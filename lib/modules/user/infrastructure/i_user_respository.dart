/// The interface is the base class to do CRUD commands. Then you implement this base class
/// to use any database (Firebase, DynamoDB, etc).
abstract class IUserRepository {
  Future<bool> isAuthenticated();

  Future<void> authenticate();

  String? getUserId();
}
