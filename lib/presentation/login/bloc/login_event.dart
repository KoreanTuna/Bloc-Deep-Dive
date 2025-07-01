part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted(this.ssoType);

  final SSOType ssoType;

  @override
  List<Object> get props => [ssoType];
}
