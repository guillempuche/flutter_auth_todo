import 'package:firebase_auth/firebase_auth.dart';

import 'i_user_respository.dart';
import '../domain/user_entity.dart';

/// Implementation of CRUD commands for Google Firebase database.
class FirebaseUserRepository implements IUserRepository {
  FirebaseUserRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<bool> isAuthenticated() async {
    final User? currentUser = _firebaseAuth.currentUser;

    return currentUser != null;
  }

  @override
  Future<void> authenticate() async {
    UserCredential firebaseUser = await _firebaseAuth.signInAnonymously();

    print(firebaseUser);
    // UserEntity(
    //   id: firebaseUser.user?.uid,
    //   isAnonymous: true,
    //   email: firebaseUser.user?.email,
    // );
  }

  @override
  String? getUserId() => _firebaseAuth.currentUser?.uid;
}
