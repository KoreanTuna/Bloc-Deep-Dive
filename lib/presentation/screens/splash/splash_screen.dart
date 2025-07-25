import 'package:door_stamp/common/bloc/authentication/authentication_bloc.dart';
import 'package:door_stamp/common/bloc/user/user_bloc.dart';
import 'package:door_stamp/common/constant/png_image_path.dart';
import 'package:door_stamp/common/data/repository/authentication_repository.dart';
import 'package:door_stamp/common/extension/context_extension.dart';
import 'package:door_stamp/presentation/widget/base/base_screen.dart';
import 'package:door_stamp/presentation/widget/image_widget.dart';
import 'package:door_stamp/router/router_path.dart';
import 'package:door_stamp/util/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({super.key});

  @override
  void onInit(BuildContext context) {
    super.onInit(context);

    final AuthenticationStatus status =
        context.read<AuthenticationBloc>().state.status;

    if (status == AuthenticationStatus.unauthenticated) {
      context.goNamed(RouterPath.login);
    } else if (status == AuthenticationStatus.authenticated) {
      final String userId = FirebaseAuth.instance.currentUser!.uid;
      context.read<UserBloc>().add(UserDataRequested(userId: userId));
    }
  }
  @override
  Widget buildScreen(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      bloc: context.read<AuthenticationBloc>(),
      listenWhen: (previous, current) {
        /// AuthenticationBloc의 상태가 변경되었을 때만 리스너를 실행
        return previous.status != current.status;
      },

      /// AuthenticationBloc의 상태가 변경되었을 때만 실행
      listener: (context, state) {
        if (state.status == AuthenticationStatus.unauthenticated) {
          context.goNamed(RouterPath.login);
        } else if (state.status == AuthenticationStatus.authenticated) {
          final String userId = FirebaseAuth.instance.currentUser!.uid;
          logger.d('사용자 ID: $userId');
          context.read<UserBloc>().add(
            UserDataRequested(userId: userId),
          );
        }
      },
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoading) {
            logger.i('사용자 정보 로드 중...');
            return;
          } else if (state is UserError) {
            logger.e('사용자 정보 로드 실패: ${state.message}');
            context.goNamed(RouterPath.login);
            return;
          }

          /// 사용자 정보가 로드되었을 때, 즐겨찾기 장르가 없으면 온보딩 화면으로 이동
          if (state is UserLoaded) {
            if (state.user.favoriteGenres == null ||
                state.user.favoriteGenres!.isEmpty) {
              logger.i('즐겨찾기 장르가 없습니다. 온보딩 화면으로 이동합니다.');
              context.goNamed(RouterPath.onboard);
              return;
            } else {
              logger.i('사용자 정보 로드 완료: ${state.user.name}');
              context.goNamed(RouterPath.home);
            }
          } else {
            context.goNamed(RouterPath.login);
          }
        },
        child: SizedBox(
          width: context.screenSize.width,
          height: context.screenSize.height,
          child: PngImageWidget(
            imagePath: PngImagePath.splashLogo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
