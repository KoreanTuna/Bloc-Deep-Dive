part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();
}

final class UserDataRequested extends UserEvent {
  final String userId;
  final UserModel? loginUserModel; // nullable

  const UserDataRequested({
    required this.userId,
    this.loginUserModel,
  });

  @override
  List<Object?> get props => [userId, loginUserModel];
}

final class UserDataUpdated extends UserEvent {
  final UserModel user;

  const UserDataUpdated(this.user);

  @override
  List<Object?> get props => [user];
}
