import 'dart:ui';

import 'package:door_stamp/common/constant/svg_image_path.dart';
import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/common/data/repository/authentication_repository.dart';
import 'package:door_stamp/core/theme/color_style.dart';
import 'package:door_stamp/core/util/logger.dart';
import 'package:door_stamp/core/util/result.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(const LoginState()) {
    on<LoginSubmitted>(_onSubmitted);
    on<LoginReset>((event, emit) {
      emit(const LoginState());
    });
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final SSOType ssoType = event.ssoType;

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        ssoType: ssoType,
      ),
    );

    switch (ssoType) {
      case SSOType.google:
        final Result<UserCredential> result =
            await _authenticationRepository.signInWithGoogle();
        logger.d('Google Sign-In result: $result');
        result.when(
          ok: (userResult) {
            logger.d('User data saved successfully.');
            emit(
              state.copyWith(
                status: FormzSubmissionStatus.success,
                user: UserModel(
                  id: userResult.user!.uid,
                  email: userResult.user!.email ?? '',
                  name: userResult.user!.displayName ?? '',
                  provider: ssoType,
                  accessToken: userResult.credential?.accessToken ?? '',
                ),
              ),
            );
          },
          error: (error) {
            logger.e('Failed to save user data: $error');
            emit(state.copyWith(status: FormzSubmissionStatus.failure));
          },
        );

        break;
      default:
    }
  }
}
