import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../infrastructure/i_user_respository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required IUserRepository userRepository})
      : _userRepository = userRepository,
        super(AuthUninialize()) {
    on<AuthAppStarted>(_onAuthAppStarted);
  }

  final IUserRepository _userRepository;

  void _onAuthAppStarted(
    AuthAppStarted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final bool isSignedIn = await _userRepository.isAuthenticated();

      if (!isSignedIn) await _userRepository.authenticate();

      final userId = _userRepository.getUserId();

      emit(userId == null ? AuthLogOut() : AuthLogIn(userId));
    } catch (_) {
      emit(AuthLogOut());
    }
  }
}
