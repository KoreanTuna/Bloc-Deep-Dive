import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/common/data/repository/user_repository.dart';
import 'package:door_stamp/util/result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userRepository) : super(const UserState.initial()) {
    on<UserDataRequested>(_onUserDataRequested);
    on<UserDataUpdated>(_onUserDataUpdated);
  }

  final UserRepository _userRepository;

  Future<void> _onUserDataRequested(
    UserDataRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());
    final Result<UserModel> user = await _userRepository.getUser(
      event.userId,
    );
    user.when(
      ok: (user) {
        emit(UserState.loaded(user));
      },
      error: (error) {
        emit(UserState.error(error.toString()));
      },
    );
  }

  Future<void> _onUserDataUpdated(
    UserDataUpdated event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loaded(event.user));
  }
}
