import 'package:bloc_deep_dive/common/data/models/user.dart';
import 'package:bloc_deep_dive/common/data/repository/authentication_repository.dart';
import 'package:bloc_deep_dive/common/data/repository/user_repository.dart';
import 'package:bloc_deep_dive/common/notifier/authentication_notifier.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
    required AuthenticationNotifier authenticationNotifier,
  }) : _authenticationRepository = authenticationRepository,
       _userRepository = userRepository,
       _authenticationNotifier = authenticationNotifier,
       super(const AuthenticationState.unknown()) {
    on<AuthenticationSubscriptionRequested>(_onSubscriptionRequested);
    on<AuthenticationLogoutPressed>(_onLogoutPressed);
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  final AuthenticationNotifier _authenticationNotifier;

  Future<void> _onSubscriptionRequested(
    AuthenticationSubscriptionRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    return emit.onEach(
      _authenticationRepository.status,
      onData: (status) async {
        switch (status) {
          case AuthenticationStatus.unauthenticated:
            _authenticationNotifier.setStatus(
              AuthenticationStatus.unauthenticated,
            );
            return emit(const AuthenticationState.unauthenticated());
          case AuthenticationStatus.authenticated:
            final user = await _tryGetUser();
            _authenticationNotifier.setStatus(
              user != null
                  ? AuthenticationStatus.authenticated
                  : AuthenticationStatus.unauthenticated,
            );
            return emit(
              user != null
                  ? AuthenticationState.authenticated(user)
                  : const AuthenticationState.unauthenticated(),
            );
          case AuthenticationStatus.unknown:
            _authenticationNotifier.setStatus(AuthenticationStatus.unknown);
            return emit(const AuthenticationState.unknown());
        }
      },
      onError: addError,
    );
  }

  void _onLogoutPressed(
    AuthenticationLogoutPressed event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
