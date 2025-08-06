import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/common/data/repository/user_repository.dart';
import 'package:door_stamp/core/util/result.dart';
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

    /// 사용자 정보가 DB에 존재하는지 확인한다.
    final Result<bool> userExists = await _userRepository.isUserExists(
      event.userId,
    );

    /// 사용자 정보가 DB에 존재하지 않거나 에러가 발생한 경우
    /// 신규 사용자로 판단하고 신규 Document를 생성하고 데이터를 가져온다.
    if ((userExists is Ok<bool> && !userExists.value) || userExists is Error) {
      if (event.loginUserModel == null) {
        emit(const UserState.error('사용자 정보가 없습니다.'));
        return;
      }
      await _userRepository.setUserData(event.loginUserModel!);
    }

    /// 사용자 정보 fetching
    await _fetchUserData(event, emit);
  }

  Future<void> _fetchUserData(
    UserDataRequested event,
    Emitter<UserState> emit,
  ) async {
    final Result<UserModel> user = await _userRepository.getUser(event.userId);
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
