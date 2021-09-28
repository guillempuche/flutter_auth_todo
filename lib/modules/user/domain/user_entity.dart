import 'package:auth_with_todo/modules/shared/unique_entity_id.dart';
import 'user_value_objects.dart';
import 'package:equatable/equatable.dart';

/// It creates the to-do task entity for the User bounded-context. This is an
/// aggregate root.
///
/// The entity uses [Equatable] as an entity base class to compare different
/// instances of User by value. It inherites ([props], [toString], [hashcode]
/// and [operator ==]).
class UserEntity extends Equatable {
  const UserEntity._({
    required id,
    email,
    required isAnonymous,
  })  : _id = id,
        _email = email,
        _isAnonymous = isAnonymous;

  factory UserEntity({
    required id,
    email,
    required isAnonymous,
  }) {
    if (isAnonymous) {
      return UserEntity._(id: id, email: null, isAnonymous: isAnonymous);
    } else {
      return UserEntity._(id: id, email: email, isAnonymous: isAnonymous);
    }
  }

  final UniqueId _id;
  final Email? _email;
  final bool _isAnonymous;

  UniqueId get id => _id;
  Email? get email => _email;
  bool get isAnonymous => _isAnonymous;

  @override
  List<Object?> get props => [_id, _email, _isAnonymous];

  @override
  String toString() => "UserEntity { id: $_id, email: $_email }";

  UserEntity copyWith({Email? email}) => UserEntity(
        id: _id,
        email: email ?? _email,
        isAnonymous: isAnonymous,
      );
}
