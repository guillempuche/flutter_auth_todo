part of 'authentication_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthUninialize extends AuthState {}

class AuthLogOut extends AuthState {}

class AuthLogIn extends AuthState {
  const AuthLogIn(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];

  @override
  String toString() => "AuthLoad { userId: $userId }";
}
