import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/common/data/repository/authentication_repository.dart';
import 'package:door_stamp/common/notifier/authentication_notifier.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required AuthenticationNotifier authenticationNotifier,
  }) : _authenticationRepository = authenticationRepository,

       _authenticationNotifier = authenticationNotifier,
       super(const AuthenticationState.unknown()) {
    on<AuthenticationSubscriptionRequested>(_onSubscriptionRequested);
    on<AuthenticationLogoutPressed>(_onLogoutPressed);
  }

  final AuthenticationRepository _authenticationRepository;
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
            _authenticationNotifier.setStatus(
              AuthenticationStatus.authenticated,
            );
            emit(
              const AuthenticationState.authenticated(),
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
}
