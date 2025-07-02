import 'dart:ui';

import 'package:door_stamp/common/constant/svg_image_path.dart';
import 'package:door_stamp/common/data/models/user_model.dart';
import 'package:door_stamp/common/data/repository/authentication_repository.dart';
import 'package:door_stamp/theme/color_style.dart';
import 'package:door_stamp/util/logger.dart';
import 'package:door_stamp/util/result.dart';

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

        if (result is Ok<UserCredential>) {
          final Result<void> userSaveResult = await _authenticationRepository
              .setUserData(
                UserModel(
                  id: result.value.user?.uid ?? '',
                  name: result.value.user?.displayName ?? '',
                  email: result.value.user?.email ?? '',
                  accessToken: result.value.credential!.accessToken!,
                ),
              );

          userSaveResult.when(
            ok: (_) {
              logger.d('User data saved successfully.');
              emit(
                state.copyWith(status: FormzSubmissionStatus.success),
              );
            },
            error: (error) {
              logger.e('Failed to save user data: $error');
              emit(state.copyWith(status: FormzSubmissionStatus.failure));
            },
          );

          emit(state.copyWith(status: FormzSubmissionStatus.success));
        } else {
          logger.e('Google Sign-In failed: $result');
          emit(
            state.copyWith(status: FormzSubmissionStatus.failure),
          );
        }
        break;
      default:
    }
  }
}
