part of 'authentication_bloc.dart';

abstract class AuthEvent extends Equatable {}

class AuthAppStarted extends AuthEvent {
  @override
  List<Object> get props => [];
}
